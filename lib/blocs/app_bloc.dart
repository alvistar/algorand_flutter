import 'dart:async';
import 'dart:convert';

import 'package:algo_explorer_api/algo_explorer_api.dart';
import 'package:algorand_flutter/blocs/utils.dart';
import 'package:bloc/bloc.dart';
import 'package:dart_algorand/algod.dart' as algod;
import 'package:dart_algorand/dart_algorand.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:manta_dart/manta_wallet.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

import '../configuration.dart';
import 'AppHomeSendSheetMapper.dart';
import 'app_event.dart';
import 'app_state.dart';
import 'package:dio/dio.dart';

import 'AppHomeInitialMapper.dart';

final Logger logger = Logger('AlgoWallet');

class AppBloc extends Bloc<AppEvent, AppState> {
  AccountApi accountApi;
  algod.AlgodApi client;
  Timer accountTimer;
  MantaWallet mantaWallet;
  Account account;
  Configuration configuration;

  AppBloc({@required this.configuration}) : super();

  @override
  AppState get initialState {
    client = init_client();
    accountApi = ExplorerApi().getAccountApi();
    print(configuration.key);
    configuration.key = '123';
    generateNewAccount();
    return initHome();

    //return ShowSeedState(address: account.address, privateKey: account.private_key);
    //return SettingsState(address: 'my_address');
    //return ImportSeedState();
  }

  initHome() {
    getAccountInformation();
    startTimer();

    return AppHome(base: BaseState(), transactions: [], currentAsset: 'algo');
  }

  static int getBalanceForAssetIndex({algod.Account account, int asset}) {
    final m = account.assets.asMap;
    return (m[asset.toString()]['amount']);
  }

  static List<String> getAssets(algod.Account account) {
    final assets = <String>[];

    account.thisassettotal.forEach((key, value) {
      assets.add(value.unitname);
    });

    return assets;
  }

  generateNewAccount() {
    account = generate_account();
  }

  getAccountInformation() async {
    logger.fine('Updating account');
    final address =
        'BICEALPAAJT3VMBTPNE6U44HAJGZKMUZQMYWVEOCGMNDVKQOTRU7OUXAZU';
    client
        .accountInformation(address)
        .then((result) => this.add(AppAccountInfoUpdate(result.data)));

    try {
      final latest = await accountApi.accountsGetLatestByIndex(address, 5);
      this.add(AppTransactionsUpdate(latest.data));
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
    }
  }

  sendTransaction({int amount, String destination, String note}) async {
    // Get params for transactions

    final params = (await client.transactionParams()).data;

    final txn = PaymentTxn(
        sender: "BICEALPAAJT3VMBTPNE6U44HAJGZKMUZQMYWVEOCGMNDVKQOTRU7OUXAZU",
        receiver: destination,
        fee: params.minFee,
        note: note != null ? utf8.encode(note) : null,
        amt: amount,
        first_valid_round: params.lastRound,
        last_valid_round: params.lastRound + 1000,
        genesis_id: params.genesisID,
        genesis_hash: params.genesishashb64);

    const PRIV_KEY =
        "ME81aVXutEYkMKdNjKHKaspLGH9+d2zQdTX8WbVazXwKBEAt4AJnurAze0nqc4cCTZUymYMxapHCMxo6qg6caQ==";

    // Sign transaction

    final st = txn.sign(PRIV_KEY);

    // Send transaction

    final rawtxn = base64Decode(msgpack_encode(st));

    final result = await client.rawTransaction(rawtxn);

    logger.info(result);
  }

  sendAssetTransaction(
      {int amount, String destination, String note, int index}) async {
    // Get params for transactions

    final params = (await client.transactionParams()).data;

    final atxn = AssetTransferTxn(
        sender: "BICEALPAAJT3VMBTPNE6U44HAJGZKMUZQMYWVEOCGMNDVKQOTRU7OUXAZU",
        index: index,
        receiver: destination,
        fee: params.minFee,
        note: note != null ? utf8.encode(note) : null,
        amt: amount,
        first_valid_round: params.lastRound,
        last_valid_round: params.lastRound + 1000,
        genesis_id: params.genesisID,
        genesis_hash: params.genesishashb64);

    const PRIV_KEY =
        "ME81aVXutEYkMKdNjKHKaspLGH9+d2zQdTX8WbVazXwKBEAt4AJnurAze0nqc4cCTZUymYMxapHCMxo6qg6caQ==";

    // Sign transaction

    final st = atxn.sign(PRIV_KEY);

    // Send transaction

    final rawtxn = base64Decode(msgpack_encode(st));

    final result = await client.rawTransaction(rawtxn);

    logger.info(result);
  }

  startTimer() {
    logger.fine('Starting account timer');
    accountTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      getAccountInformation();
    });
  }

  stopTimer() {
    logger.fine('Stopping account timer');
    accountTimer.cancel();
  }

  @override
  void onTransition(Transition<AppEvent, AppState> transition) {
    // On enter InitialAppState
    if (transition.nextState is AppHomeInitial &&
        !(transition.currentState is AppHomeInitial)) {
      startTimer();
    }

    // On exit InitialAppState
    if (transition.currentState is AppHomeInitial &&
        !(transition.nextState is AppHomeInitial)) {
      stopTimer();
    }

    super.onTransition(transition);
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (state is AppHomeInitial) {
      yield* AppHomeInitialMapper(event, state).map();
    } else if (state is AppHomeSendSheet) {
      yield* AppHomeSendSheetMapper(event, state).map();
    }

    // Handle global app events

    if (event is AppMantaSheetDismissed) {
      yield (state as AppHome).toSendSheet();
    } else if (event is AppSend) {
      yield* _mapSendToState(event);
    }
    else if (event is AppSeedImported) {
      account = Account(
          private_key: to_private_key(event.seed),
          address: to_public_key(event.seed));
      yield AppSeed(
          address: account.address, privateKey: account.private_key);
    } else if (event is AppSettingsShow) {
      yield AppSettings(address: account.address, pstate: state);
    } else if (event is AppBack) {
      yield (state as Backable).pstate;
    } else if (event is AppImportSeedShow) {
      yield AppImportSeed(pstate: state);
    } else if (event is AppForward) {
      if (state is AppSeed) {
        yield initHome();
      }
    }
  }


  Stream<AppState> _mapSendToState(AppSend event) async* {
    final note = mantaWallet == null ? null : mantaWallet.session_id;
    final currentAsset = (state as AppHome).currentAsset;

    if (currentAsset == 'algo') {
      sendTransaction(
          destination: event.destination, amount: event.amount, note: note);
    } else {
      sendAssetTransaction(
          destination: event.destination,
          amount: event.amount,
          note: note,
          index: getAssetIndex(
              account: state.base.accountInfo, asset: currentAsset));
    }

    yield (state as AppHome).toInitialState();
  }
}



algod.AlgodApi init_client() {
  final options = BaseOptions(
    baseUrl: 'http://algorand-testnet.beappia.com',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  final dio = Dio(options);
  dio.interceptors.add(InterceptorsWrapper(onRequest: (Options options) {
    options.headers['X-Algo-API-Token'] =
        'b5985ac6e3b5203003b4af1466d799055101fad921c89b9ba004c3dd409d4b22';
  }, onError: (DioError e) {
    if (e.response != null) {
      print(e.response.data);
      print(e.response.headers);
      print(e.response.request);
    } else {
      // Something happened in setting up or sending the request that triggered an Error
      print(e.request);
      print(e.message);
    }

    return e;
  }));

  return algod.Openapi(dio: dio).getAlgodApi();
}
