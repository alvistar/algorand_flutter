import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:algo_explorer_api/algo_explorer_api.dart';
import 'package:algorand_flutter/algo_repository.dart';
import 'package:algorand_flutter/blocs/AppImportSeedMapper.dart';
import 'package:algorand_flutter/blocs/AppSeedMapper.dart';
import 'package:algorand_flutter/blocs/utils.dart';
import 'package:bloc/bloc.dart';
import 'package:dart_algorand/algod.dart' as algod;
import 'package:dart_algorand/algod/model/account.dart';
import 'package:dart_algorand/dart_algorand.dart';
import 'package:manta_dart/manta_wallet.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

import '../configuration.dart';
import 'AppAccountSetupMapper.dart';
import 'AppHomeMantaSheetMapper.dart';
import 'AppHomeReceiveSheetMapper.dart';
import 'AppHomeSendSheetMapper.dart';
import 'AppSettingsMapper.dart';
import 'app_event.dart';
import 'app_state.dart';

import 'AppHomeInitialMapper.dart';

final Logger logger = Logger('AlgoWallet');

class AppBloc extends Bloc<AppEvent, AppState>
    with
        AppHomeSendSheetMapper,
        AppHomeInitialMapper,
        AppHomeMantaSheetMapper,
        AppSettingsMapper,
        AppImportSeedMapper,
        AppSeedMapper,
        AppAccountSetupMapper,
        AppHomeReceiveSheetMapper {
  Timer accountTimer;
  MantaWallet mantaWallet;
  Configuration configuration;
  AppBloc appBloc;
  AlgoRepository repository = AlgoRepository();
  Completer<void> updating;
  StreamSubscription<List> txSubscription;
  StreamSubscription<Account> accountSubscription;

  AppBloc({@required this.configuration}) : super();

  @override
  AppState get initialState {
    appBloc = this;

    final account = configuration.account;

    if (account == null) {
      return AppAccountSetup(base: BaseState());
    }

    return initHome(account);

    //return initHome();

    //return ShowSeedState(address: account.address, privateKey: account.private_key);
    //return SettingsState(address: 'my_address');
    //return ImportSeedState();
    // return AppAccountSetup(base: BaseState());
  }

  subscribeTX({String address, int asset}) {
    txSubscription = repository
        .getTransactionStream(address: address, asset: asset)
        .listen((event) {
      add(AppTransactionsUpdated(event));
    });
  }

  subscribeAccount(address) {
    accountSubscription = repository.getAccountStream(address).listen((event) {
      add(AppAccountInfoUpdated(event));
    });
  }

  initHome(AlgoAccount account) {
    subscribeTX(address: account.address, asset: -1);
    subscribeAccount(account.address);

    return AppHome(
        base: BaseState(account: account), transactions: [], currentAsset: -1);
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    // Events handled by mappers

    if (state is AppHomeInitial) {
      yield* mapAppHomeInitialToState(event, state);
    } else if (state is AppHomeSendSheet) {
      yield* mapAppHomeSendSheetToState(event, state);
    } else if (state is AppHomeReceiveSheet) {
      yield* mapAppHomeReceiveSheetToState(event, state);
    } else if (state is AppHomeMantaSheet) {
      yield* mapAppHomeMantaSheetToState(event, state);
    } else if (state is AppSettings) {
      yield* mapAppSettingsToState(event, state);
    } else if (state is AppImportSeed) {
      yield* mapAppImportSeedToState(event, state);
    } else if (state is AppSeed) {
      yield* mapAppSeedToState(event, state);
    } else if (state is AppAccountSetup) {
      yield* mapAppAccountSetupToState(event, state);
    } else {
      throw UnimplementedError('Appbloc was unable to map $event');
    }
  }

  @override
  Stream<AppState> mapGlobalEventToState(AppEvent event) async* {
    if (event is AppSend) {
      yield* _mapSendToState(event);
    } else {
      throw UnimplementedError('Appbloc (global) was unable to map $event');
    }
  }

  Future<String> sendTransaction(
      {int amount, String destination, String note}) async {
    // Get params for transactions

    final params = await repository.getTransactionParams();

    final txn = PaymentTxn(
        sender: state.base.account.address,
        receiver: destination,
        fee: params.minFee,
        note: note != null ? utf8.encode(note) : null,
        amt: amount,
        first_valid_round: params.lastRound,
        last_valid_round: params.lastRound + 1000,
        genesis_id: params.genesisID,
        genesis_hash: params.genesishashb64);

    final PRIV_KEY = state.base.account.private_key;

    // Sign transaction

    final st = txn.sign(PRIV_KEY);

    // Send transaction

    final rawtxn = base64Decode(msgpack_encode(st));

    final result = await repository.sendRawTransaction(rawtxn);

    logger.info(result);
    return result.txId;
  }

  Future<String> sendAssetTransaction(
      {int amount, String destination, String note, int index}) async {
    // Get params for transactions

    final params = await repository.getTransactionParams();

    final atxn = AssetTransferTxn(
        sender: state.base.account.address,
        index: index,
        receiver: destination,
        fee: params.minFee,
        note: note != null ? utf8.encode(note) : null,
        amt: amount,
        first_valid_round: params.lastRound,
        last_valid_round: params.lastRound + 1000,
        genesis_id: params.genesisID,
        genesis_hash: params.genesishashb64);

    final PRIV_KEY = state.base.account.private_key;
    // Sign transaction

    final st = atxn.sign(PRIV_KEY);

    // Send transaction

    final rawtxn = base64Decode(msgpack_encode(st));

    final result = await repository.sendRawTransaction(rawtxn);

    logger.info(result);

    return result.txId;
  }

  @override
  void onTransition(Transition<AppEvent, AppState> transition) {
    // Save changes in preferences
    if (transition.nextState.base.account?.private_key !=
        transition.currentState.base.account?.private_key) {
      configuration.account = transition.nextState.base.account;
    }

    // On enter InitialAppState
    if (transition.nextState is AppHomeInitial &&
        !(transition.currentState is AppHomeInitial)) {
      subscribeTX(
          address: transition.nextState.base.account.address,
          asset: (transition.nextState as AppHomeInitial).currentAsset);

      subscribeAccount(transition.nextState.base.account.address);
    }

    // On exit InitialAppState
    if (transition.currentState is AppHomeInitial &&
        !(transition.nextState is AppHomeInitial)) {
      txSubscription.cancel();
      accountSubscription.cancel();
    }

    super.onTransition(transition);
  }

  Stream<AppState> _mapSendToState(AppSend event) async* {
    final note = mantaWallet == null ? null : mantaWallet.session_id;
    final currentAsset = (state as AppHome).currentAsset;
    String txid;

    if (currentAsset == -1) {
      txid = await sendTransaction(
          destination: event.destination, amount: event.amount, note: note);
    } else {
      txid = await sendAssetTransaction(
          destination: event.destination,
          amount: event.amount,
          note: note,
          index: currentAsset);
    }

    if (mantaWallet != null) {
      await mantaWallet.sendPayment(
          transactionHash: txid, cryptoCurrency: 'ALGO-TESTNET');
      mantaWallet = null;
    }

    yield (state as AppHome).toInitialState();
  }

  Future<void> addAsync(AppEvent event) {
    updating = Completer();
    add(event);

    return updating.future;
  }
}
