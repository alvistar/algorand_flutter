import 'package:manta_dart/messages.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

class AppState {}

@freezed
abstract class HomeState with _$HomeState implements AppState {
  factory HomeState(
      {int balance,
      String unit,
      @Default(const <String>[])List<String> assets,
      @Default(const []) List transactions,
      String currentAsset}) = HomeInitialState;

  factory HomeState.SendSheetState(
      {int balance,
      String unit,
      List<String> assets,
      List transactions,
      String currentAsset,
      int destAmount,
      String destAddress}) = HomeSendSheetState;

  factory HomeState.MantaSheetState(
      {int balance,
      String unit,
      List<String> assets,
      List transactions,
      String currentAsset,
      Merchant merchant,
      Destination destination}) = HomeMantaSheetState;
}

extension Utils on HomeState {
  HomeSendSheetState toSendSheet({int destAmount, String destAddress}) {
    return HomeState.SendSheetState(
        balance: balance,
        unit: unit,
        assets: assets,
        transactions: transactions,
        currentAsset: currentAsset,
        destAmount: destAmount,
        destAddress: destAddress);
  }

  HomeSendSheetState toMantaSheet({Merchant merchant,
    Destination destination}) {
    return HomeState.MantaSheetState(
        balance: balance,
        unit: unit,
        assets: assets,
        transactions: transactions,
        currentAsset: currentAsset,
        destination: destination,
        merchant: merchant);
  }

  HomeInitialState toInitialState() {
    return HomeState(
      balance: balance,
      unit: unit,
      assets: assets,
      transactions: transactions,
      currentAsset: currentAsset,
    );
  }
}

