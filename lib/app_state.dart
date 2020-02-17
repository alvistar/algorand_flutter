import 'package:algorand_flutter/main.dart';
import 'package:equatable/equatable.dart';

abstract class AppState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialAppState extends AppState {
  final int amount;

  InitialAppState(this.amount);

  @override
  List<Object> get props => [amount];
}

class SendSheetState extends InitialAppState {
  SendSheetState(int amount) : super(amount);

}