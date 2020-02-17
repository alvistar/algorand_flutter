import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
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

class SendSheetShow extends AppEvent {
  @override
  List<Object> get props => [];
}


class SendSheetDismissed extends AppEvent {
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