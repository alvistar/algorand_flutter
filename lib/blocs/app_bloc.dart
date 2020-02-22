import 'dart:async';
import 'dart:convert';

import 'package:algo_explorer_api/algo_explorer_api.dart';
import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dart_algorand/dart_algorand.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:manta_dart/manta_wallet.dart';
import 'package:openapi/api.dart';
import 'package:openapi/api/default_api.dart';
import 'package:logging/logging.dart';
import 'package:algo_explorer_api/algo_explorer_api.dart';
import 'package:openapi/model/account.dart';
import 'package:openapi/model/asset_params.dart';

import 'app_event.dart';
import 'app_state.dart';
import 'package:dio/dio.dart';

final Logger logger = Logger('AlgoWallet');

class AppBloc extends Bloc<AppEvent, AppState> {
  AccountApi accountApi;
  DefaultApi client;
  Timer accountTimer;
  MantaWallet mantaWallet;
  Account accountInfo;

  @override
  // TODO: implement initialState
  AppState get initialState {
    client = init_client();
    accountApi = ExplorerApi().getAccountApi();
    getAccountInformation();
    startTimer();

    return HomeState(transactions: [], currentAsset: 'algo');
  }

  static int getBalanceForAssetIndex({Account account, int asset}) {
    final m = account.assets.asMap;
    return (m[asset.toString()]['amount']);
  }

  int getAssetIndex(String asset) {
    final key = accountInfo.thisassettotal.keys.firstWhere(
            (k) => accountInfo.thisassettotal[k].unitname == asset);
    return int.parse(key);
  }

  int getBalance([String asset]) {
    final s = state as HomeState;

    asset ??= s.currentAsset;

    if (accountInfo == null) {
      return 0;
    }

    if (asset == 'algo') {
      return accountInfo.amount;
    }

    return getBalanceForAssetIndex(
        account: accountInfo,
        asset: getAssetIndex(asset));
  }


  static List<String> getAssets(Account account) {
    final assets = <String>[];

    account.thisassettotal.forEach((key, value) {
      assets.add(value.unitname);
    });

    return assets;
  }

  getAccountInformation() async {
    logger.fine('Updating account');
    final address =
        'BICEALPAAJT3VMBTPNE6U44HAJGZKMUZQMYWVEOCGMNDVKQOTRU7OUXAZU';
    client
        .accountInformation(address)
        .then((result) => this.add(AccountInfoUpdate(result.data)));

    try {
      final latest = await accountApi.accountsGetLatestByIndex(address, 5);
      this.add(TransactionsUpdate(latest.data));
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
        note: note != null ? utf8.encode(note): null,
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
        note: note != null ? utf8.encode(note): null,
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
    if (transition.nextState is HomeInitialState &&
        !(transition.currentState is HomeInitialState)) {
      startTimer();
    }

    // On exit InitialAppState
    if (transition.currentState is HomeInitialState &&
        !(transition.nextState is HomeInitialState)) {
      stopTimer();
    }

    super.onTransition(transition);
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is AccountInfoUpdate) {
      yield* _mapAccountInfoUpdateToState(event);
    } else if (event is TransactionsUpdate) {
      yield (state as HomeState).copyWith(transactions: event.transactions);
    } else if (event is SendSheetShow) {
      yield (state as HomeState).toSendSheet();
    } else if (event is SendSheetDismissed) {
      yield (state as HomeState).toInitialState();
    } else if (event is MantaSheetDismissed) {
      yield (state as HomeState).toSendSheet();
    } else if (event is Send) {
      yield* _mapSendToState(event);
    } else if (event is ScanQR) {
      yield* _mapScanQRtoState(event);
    } else if (event is ChangeAsset) {
      yield (state as HomeState).copyWith(
          balance: getBalance(event.asset),
          currentAsset: event.asset);
    }
  }

  Stream<AppState> _mapSendToState(Send event) async* {
    final note = mantaWallet == null ? null : mantaWallet.session_id;
    final currentAsset = (state as HomeState).currentAsset;

    if (currentAsset == 'algo') {
      sendTransaction(
          destination: event.destination, amount: event.amount, note: note);
    }
    else {
      sendAssetTransaction(
          destination: event.destination, amount: event.amount, note: note,
          index: getAssetIndex(currentAsset)
      );
    }

    yield (state as HomeState).toInitialState();
  }

  Stream<AppState> _mapAccountInfoUpdateToState(
      AccountInfoUpdate event) async* {
    final assets = <String>['algo'];
    assets.addAll(getAssets(event.account));
    accountInfo = event.account;

    yield (state as HomeState).copyWith(
        balance: getBalance(),
        assets: assets
    );
  }

  Stream<AppState> _mapScanQRtoState(ScanQR event) async* {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", true, ScanMode.QR);

    // Test Manta Url
    final mantaParsed = MantaWallet.parseUrl(barcodeScanRes);

    if (mantaParsed != null) {
      print("Manta Address!");
      mantaWallet = MantaWallet(barcodeScanRes);
      final envelope =
      await mantaWallet.getPaymentRequest(cryptoCurrency: "ALGO-TESTNET");
      final pr = envelope.unpack();

      yield (state as HomeState).toMantaSheet(
          merchant: pr.merchant,
          destination: pr.destinations[0]);
    }

    final parsed = parseUrl(barcodeScanRes);

    if (parsed != null) {
      yield (state as HomeState).toSendSheet(
          destAddress: parsed.address,
          destAmount: parsed.amount);
    }
  }
}

DefaultApi init_client() {
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

  return Openapi(dio: dio).getDefaultApi();
}
