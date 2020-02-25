import 'dart:typed_data';

import 'package:algo_explorer_api/algo_explorer_api.dart';
import 'package:dart_algorand/algod.dart' as algod;
import 'package:dart_algorand/algod/model/asset_params.dart';
import 'package:dart_algorand/algod/model/transaction_id.dart';
import 'package:dart_algorand/algod/model/transaction_params.dart';
import 'package:dio/dio.dart';

class AlgoRepository {
  algod.AlgodApi algodApi;
  AccountApi accountApi;
  Map<String, AssetParams> assetInformation= <String, AssetParams>{};

  AlgoRepository() {
    algodApi = init_client();
    accountApi = ExplorerApi().getAccountApi();
  }

  Future<algod.Account> getAccountInformation(String address) async {
    return (await algodApi.accountInformation(address)).data;
  }

  Future<List> getLatestTransactionsByIndex({String address, int limit}) async {
    return (await accountApi.accountsGetLatestByIndex(address, 5)).data;
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
