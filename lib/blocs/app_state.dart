import 'package:manta_dart/messages.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
abstract class BaseState with _$BaseState {
  factory BaseState() = _BaseState;
}

abstract class AppState {
  BaseState get base;
}

@freezed
abstract class HomeState with _$HomeState implements AppState {
  factory HomeState(
      {BaseState base,
      int balance,
      String unit,
      @Default(const <String>[]) List<String> assets,
      @Default(const []) List transactions,
      String currentAsset}) = HomeInitialState;

  factory HomeState.SendSheetState(
      {BaseState base,
      int balance,
      String unit,
      List<String> assets,
      List transactions,
      String currentAsset,
      int destAmount,
      String destAddress}) = HomeSendSheetState;

  factory HomeState.MantaSheetState(
      {BaseState base,
      int balance,
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
        base: base,
        balance: balance,
        unit: unit,
        assets: assets,
        transactions: transactions,
        currentAsset: currentAsset,
        destAmount: destAmount,
        destAddress: destAddress);
  }

  HomeSendSheetState toMantaSheet(
      {Merchant merchant, Destination destination}) {
    return HomeState.MantaSheetState(
        base: base,
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
      base: base,
      balance: balance,
      unit: unit,
      assets: assets,
      transactions: transactions,
      currentAsset: currentAsset,
    );
  }
}

@freezed
abstract class ShowSeedState with _$ShowSeedState implements AppState {
  factory ShowSeedState({BaseState base, String address, String privateKey}) =
      _ShowSeedState;
}

@freezed
abstract class SettingsState with _$SettingsState implements AppState {
  factory SettingsState({BaseState base, AppState pstate, String address}) =
      _SettingsState;
}

class ImportSeedState implements AppState {
  final BaseState base;

  ImportSeedState([this.base]);
}
