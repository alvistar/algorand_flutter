import 'package:dart_algorand/algod.dart' as algod;
import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
//  @override
//  bool get stringify => true;
}

class AppAccountInfoUpdated extends AppEvent {
  final algod.Account account;

  AppAccountInfoUpdated(this.account);

  @override
  List<Object> get props => [account];
}

class AppTransactionsUpdated extends AppEvent {
  final List transactions;

  AppTransactionsUpdated(this.transactions);

  @override
  List<Object> get props => [transactions];
}

class AppTransactionsUpdate extends AppEvent {
  @override
  List<Object> get props => [];
}

class AppSendSheetShow extends AppEvent {
  @override
  List<Object> get props => [];
}


class AppSendSheetDismissed extends AppEvent {
  @override
  List<Object> get props => [];
}

class AppMantaSheetDismissed extends AppEvent {
  @override
  List<Object> get props => [];
}

class AppSend extends AppEvent {
  final int amount;
  final String destination;

  AppSend({this.amount, this.destination});

  @override
  List<Object> get props => [amount, destination];

  @override
  String toString() {
    return 'Send Event - $amount to $destination';
  }
}

class AppParseURL extends AppEvent {
  final String url;

  AppParseURL(this.url);

  @override
  List<Object> get props => [url];
}

class AppQRScan extends AppEvent {
  @override
  List<Object> get props => [];
}

class AppAssetChanged extends AppEvent {
  final int asset;

  AppAssetChanged(this.asset);

  @override
  List<Object> get props => [asset];

}

class AppImportSeedShow extends AppEvent {
  @override
  List<Object> get props => [];
}

class AppSettingsShow extends AppEvent {
  @override
  List<Object> get props => [];
}

class AppSeedShow extends AppEvent {
  @override
  List<Object> get props => [];
}

class AppSeedImported extends AppEvent {
  final String seed;

  AppSeedImported(this.seed);

  @override
  List<Object> get props => [seed];
}

class AppBack extends AppEvent {
  @override
  List<Object> get props => [];
}

class AppForward extends AppEvent {
  @override
  List<Object> get props => [];
}

class AppSeedGenerate extends AppEvent {
  @override
  List<Object> get props => [];
}

class AppAccountInformationGet extends AppEvent {
  @override
  List<Object> get props => [];
}

class AppSeedReset extends AppEvent {
  @override
  List<Object> get props => [];
}