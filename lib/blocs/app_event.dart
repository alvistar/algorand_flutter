import 'package:algorand_flutter/main.dart';
import 'package:dart_algorand/algod.dart' as algod;
import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

class AccountInfoUpdate extends AppEvent {
  final algod.Account account;

  AccountInfoUpdate(this.account);

  @override
  List<Object> get props => [account];
}

class TransactionsUpdate extends AppEvent {
  final List transactions;

  TransactionsUpdate(this.transactions);

  @override
  List<Object> get props => [transactions];
}

class SendSheetShow extends AppEvent {
  @override
  List<Object> get props => [];
}


class SendSheetDismissed extends AppEvent {
  @override
  List<Object> get props => [];
}

class MantaSheetDismissed extends AppEvent {
  @override
  List<Object> get props => [];
}

class Send extends AppEvent {
  final int amount;
  final String destination;

  Send({this.amount, this.destination});

  @override
  List<Object> get props => [amount, destination];

  @override
  String toString() {
    return 'Send Event - $amount to $destination';
  }
}

class ParseURL extends AppEvent {
  final String url;

  ParseURL(this.url);

  @override
  List<Object> get props => [url];
}

class ScanQR extends AppEvent {
  @override
  List<Object> get props => [];
}

class ChangeAsset extends AppEvent {
  final String asset;

  ChangeAsset(this.asset);

  @override
  List<Object> get props => [asset];

}

class ShowImportSeed extends AppEvent {
  @override
  List<Object> get props => [];
}

class ShowSettings extends AppEvent {
  @override
  List<Object> get props => [];
}

class ImportedSeed extends AppEvent {
  final String seed;

  ImportedSeed(this.seed);

  @override
  List<Object> get props => [seed];
}

class Back extends AppEvent {
  @override
  List<Object> get props => [];
}

class Forward extends AppEvent {
  @override
  List<Object> get props => [];
}