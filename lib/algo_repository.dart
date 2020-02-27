import 'dart:typed_data';
import 'dart:async';
import 'dart:ui';

import 'package:algo_explorer_api/algo_explorer_api.dart';
import 'package:algorand_flutter/account_stream_provider.dart';
import 'package:algorand_flutter/transaction_stream_provider.dart';
import 'package:dart_algorand/algod.dart' as algod;
import 'package:dart_algorand/algod/model/asset_params.dart';
import 'package:dart_algorand/algod/model/transaction_id.dart';
import 'package:dart_algorand/algod/model/transaction_params.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rxdart/rxdart.dart';

class AlgoRepository {
  algod.AlgodApi algodApi;
  AccountApi accountApi;
  Map<String, AssetParams> assetInformation = <String, AssetParams>{};
  Map<String, Map<int, TransactionStreamProvider>> transactions = {};
  AccountStreamProvider accountStreamProvider;

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

//  Stream<algod.Account> accountInformationStream(String address) {
//    return Stream.periodic(Duration(seconds: 5))
//        .asyncMap((event) => getAccountInformation(address));
//  }

  ValueStream<algod.Account> getAccountStream(String address) {
    if (accountStreamProvider == null ||
        accountStreamProvider?.address != address) {
      accountStreamProvider =
          AccountStreamProvider(address: address, repository: this);
    }

    return accountStreamProvider.stream;
  }

  ValueStream<List> getTransactionStream({String address, int asset}) {
    if (transactions[address] == null) {
      transactions[address] = {};
    }
    if (transactions[address][asset] == null) {
      transactions[address][asset] = TransactionStreamProvider(
          asset: asset, address: address, repository: this);
    }

    return transactions[address][asset].stream;
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
    baseUrl: DotEnv().env['ALGO_NODE_HOST'],
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  final dio = Dio(options);
  dio.interceptors.add(InterceptorsWrapper(onRequest: (Options options) {
    options.headers['X-Algo-API-Token'] = DotEnv().env['ALGO_NODE_TOKEN'];
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
