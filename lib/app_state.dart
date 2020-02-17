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

class SendSheetAppState extends InitialAppState {
  SendSheetAppState(int amount) : super(amount);

}