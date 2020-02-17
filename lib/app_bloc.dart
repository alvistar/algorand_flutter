import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dart_algorand/dart_algorand.dart';
import 'package:flutter/cupertino.dart';
import 'package:openapi/api.dart';
import 'package:openapi/api/default_api.dart';
import 'package:logging/logging.dart';

import 'app_event.dart';
import 'app_state.dart';

final Logger logger = Logger('AlgoWallet');

class AppBloc extends Bloc <AppEvent, AppState>{
  DefaultApi client;
  Timer accountTimer;

  @override
  // TODO: implement initialState
  AppState get initialState {
    client = init_client();
    getAccountInformation();
    startTimer();

    return InitialAppState(0);
  }

  getAccountInformation() async {
    logger.fine('Updating account');
    client.accountInformation("BICEALPAAJT3VMBTPNE6U44HAJGZKMUZQMYWVEOCGMNDVKQOTRU7OUXAZU").then(
        (result) => this.add(AccountInfoUpdate(result))
    );
  }

  sendTransaction({int amount, String destination}) async {
    // Get params for transactions

    final params = await client.transactionParams();

    final txn = PaymentTxn(
      sender: "BICEALPAAJT3VMBTPNE6U44HAJGZKMUZQMYWVEOCGMNDVKQOTRU7OUXAZU",
      receiver: destination,
      fee: params.minFee,
      amt: amount,
      first_valid_round: params.lastRound,
      last_valid_round: params.lastRound+1000,
      genesis_id: params.genesisID,
      genesis_hash: params.genesishashb64);

    const PRIV_KEY = "ME81aVXutEYkMKdNjKHKaspLGH9+d2zQdTX8WbVazXwKBEAt4AJnurAze0nqc4cCTZUymYMxapHCMxo6qg6caQ==";

    // Sign transaction

    final st = txn.sign(PRIV_KEY);

    // Send transaction

    final rawtxn =base64Decode(msgpack_encode(st));

    final result = await client.rawTransaction(rawtxn);

    logger.info(result);

  }


  startTimer() {
    logger.fine('Starting account timer');
    accountTimer = Timer.periodic(const Duration(seconds: 5), (_) { getAccountInformation(); });
  }

  stopTimer() {
    logger.fine('Stopping account timer');
    accountTimer.cancel();
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async*{
    if (event is AccountInfoUpdate) {
      yield InitialAppState(event.account.amount);
    } else if (event is SendSheetShow) {
      stopTimer();
      yield SendSheetAppState((this.state as InitialAppState).amount);
    } else if (event is SendSheetDismissed) {
      startTimer();
      yield InitialAppState((this.state as InitialAppState).amount);
    } else if (event is Send) {
      //sendTransaction(destination: event.destination, amount: event.amount);
      startTimer();
      yield InitialAppState((this.state as InitialAppState).amount);
    }
  }
}


DefaultApi init_client () {

  final jaguarApiGen = Openapi(baseUrl: "http://algorand-testnet.beappia.com");
  jaguarApiGen.setApiKey('api_key', "b5985ac6e3b5203003b4af1466d799055101fad921c89b9ba004c3dd409d4b22");

  return jaguarApiGen.getDefaultApi();
}