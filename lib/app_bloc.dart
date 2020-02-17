import 'dart:async';

import 'package:bloc/bloc.dart';
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
      yield SendSheetState((this.state as InitialAppState).amount);
    } else if (event is SendSheetDismissed) {
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