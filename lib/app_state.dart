import 'package:equatable/equatable.dart';
import 'package:manta_dart/messages.dart';

abstract class AppState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialAppState extends AppState {
  final int balance;

  InitialAppState(this.balance);

  @override
  List<Object> get props => [balance];
}

class SendSheetAppState extends InitialAppState {
  final int destAmount;
  final String destAddress;

  SendSheetAppState({int balance, this.destAddress, this.destAmount})
      : super(balance);

  @override
  List<Object> get props => [balance, destAmount, destAddress];
}

class MantaSheetAppState extends InitialAppState {
  final Merchant merchant;
  final Destination destination;

  MantaSheetAppState({int balance, this.merchant, this.destination})
      : super(balance);

  @override
  List<Object> get props => [balance, merchant];
}
