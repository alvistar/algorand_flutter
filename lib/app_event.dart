import 'package:equatable/equatable.dart';
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