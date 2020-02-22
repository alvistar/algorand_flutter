import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:manta_dart/messages.dart';
import 'package:openapi/model/account.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

class AccountInfoUpdate extends AppEvent {
  final Account account;

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