import 'dart:typed_data';
import 'dart:async';
import 'dart:ui';

import 'package:algo_explorer_api/algo_explorer_api.dart';
import 'package:dart_algorand/algod.dart' as algod;
import 'package:dart_algorand/algod/model/asset_params.dart';
import 'package:dart_algorand/algod/model/transaction_id.dart';
import 'package:dart_algorand/algod/model/transaction_params.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

class TXNewSubject {
  final List _transactions = [];
  final BehaviorSubject _subject = BehaviorSubject<List>();
  final PublishSubject _addSubject = PublishSubject<void>();
  final AlgoRepository repository;
  final String address;
  final int asset;
  Timer timer;
  StreamSubscription<List> _subscription;

  Stream addStream(Stream<List> stream) {
    final s = stream
        .expand((element) => element)
        .distinctUnique()
        .asBroadcastStream();
    s.forEach((element) {
      if (!_transactions.contains(element)) {
        _transactions.add(element);
      }
    });
    return s;
  }

  _startPeriodicTimer() {
    timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      _addSubject.add(null);
    });
  }

  TXNewSubject({this.address, this.asset, this.repository}) {
    final s = _addSubject.stream.asyncMap((event) {
      print('Updating for asset $asset');
      return repository.getLatestAssetTransactionsByIndex(
          address: address, limit: 5, asset: asset);
    });

    final output = addStream(s).map((event) => _transactions).distinct();

    _addSubject.add(null);

    _subscription = output.listen((event) {
      _subject.add(event);
    });

    _subject.onListen = _onListen;

    _subject.onCancel = () async {
      print('cancelling timer');
      timer.cancel();
    };
  }

  _onListen() {
    print('Listening');
    _startPeriodicTimer();
  }
}

class AlgoRepository {
  algod.AlgodApi algodApi;
  AccountApi accountApi;
  Map<String, AssetParams> assetInformation = <String, AssetParams>{};
  Map<String, Map<int, TXNewSubject>> transactions = {};

  AlgoRepository() {
    algodApi = init_client();
    accountApi = ExplorerApi().getAccountApi();
  }

  Future<algod.Account> getAccountInformation(String address) async {
    return (await algodApi.accountInformation(address)).data;
  }

//  Future<List> getLatestTransactionsByIndex({String address, int limit}) async {
//    return (await accountApi.accountsGetLatestByIndex(address, 5)).data;
//  }

  Future<List> getLatestAssetTransactionsByIndex(
      {String address, int limit, int asset}) async {
    return (await accountApi.accountsGetLatestAssetEventByIndex(
        address: address, count: limit, assetID: asset))
        .data;
  }

  Stream<algod.Account> accountInformationStream(String address) {
    return Stream.periodic(Duration(seconds: 5))
        .asyncMap((event) => getAccountInformation(address));
  }

  ValueStream<List> getTransactionStream({String address, int asset}) {
    if (transactions[address] == null) {
      transactions[address] = {};
    }
    if (transactions[address][asset] == null) {
      transactions[address][asset] =
          TXNewSubject(asset: asset, address: address, repository: this);
    }

    return transactions[address][asset]._subject.stream;
  }

  Future<TransactionParams> getTransactionParams() async {
    return (await algodApi.transactionParams()).data;
  }

  Future<TransactionID> sendRawTransaction(Uint8List rawtxn) async {
    return (await algodApi.rawTransaction(rawtxn)).data;
  }

  Future<AssetParams> getAssetInformation(int index) async {
    if (assetInformation.containsKey(index.toString())) {
      return assetInformation[index.toString()];
    }

    final assetInfo = (await algodApi.assetInformation(index)).data;
    assetInformation[index.toString()] = assetInfo;

    return assetInfo;
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
