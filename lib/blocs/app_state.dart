import 'package:manta_dart/messages.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dart_algorand/algod.dart';
import 'package:dart_algorand/dart_algorand.dart';

part 'app_state.freezed.dart';


@freezed
abstract class BaseState with _$BaseState {
  factory BaseState({Account accountInfo, AlgoAccount account}) = _BaseState;
}

abstract class AppState {
  BaseState get base;
}

@freezed
abstract class AppHome with _$AppHome implements AppState {
  factory AppHome(
      {BaseState base,
      int balance,
      String unit,
      @Default(const  {}) Map<String, int>  assets,
      @Default(const []) List transactions,
      int currentAsset}) = AppHomeInitial;

  factory AppHome.ReceiveSheetState(
      {BaseState base,
        int balance,
        String unit,
        @Default(const  {}) Map<String, int>  assets,
        @Default(const []) List transactions,
        int currentAsset}) = AppHomeReceiveSheet;

  factory AppHome.SendSheetState(
      {BaseState base,
      int balance,
      String unit,
      Map<String, int> assets,
      List transactions,
      int currentAsset,
      int destAmount,
      String destAddress}) = AppHomeSendSheet;

  factory AppHome.MantaSheetState(
      {BaseState base,
      int balance,
      String unit,
      Map<String, int>  assets,
      List transactions,
      int currentAsset,
      Merchant merchant,
      Destination destination}) = AppHomeMantaSheet;
}

extension Utils on AppHome {
  AppHomeSendSheet toSendSheet({int destAmount, String destAddress}) {
    return AppHome.SendSheetState(
        base: base,
        balance: balance,
        unit: unit,
        assets: assets,
        transactions: transactions,
        currentAsset: currentAsset,
        destAmount: destAmount,
        destAddress: destAddress);
  }

  AppHomeReceiveSheet toReceiveSheet ({int destAmount, String destAddress}) {
    return AppHome.ReceiveSheetState(
        base: base,
        balance: balance,
        unit: unit,
        assets: assets,
        transactions: transactions,
        currentAsset: currentAsset);
  }

  AppHomeMantaSheet toMantaSheet({Merchant merchant, Destination destination}) {
    return AppHome.MantaSheetState(
        base: base,
        balance: balance,
        unit: unit,
        assets: assets,
        transactions: transactions,
        currentAsset: currentAsset,
        destination: destination,
        merchant: merchant);
  }

  AppHomeInitial toInitialState() {
    return AppHome(
      base: base,
      balance: balance,
      unit: unit,
      assets: assets,
      transactions: transactions,
      currentAsset: currentAsset,
    );
  }
}

abstract class Backable {
  AppState get pstate;
}

@freezed
abstract class AppSeed with _$AppSeed implements AppState, Backable {
  factory AppSeed(
      {BaseState base, AppState pstate, @Default(false) bool forwardable}) = _AppSeed;
}

@freezed
abstract class AppSettings with _$AppSettings implements AppState, Backable {
  factory AppSettings({BaseState base, AppState pstate}) =
      _AppSettings;
}

@freezed
abstract class AppImportSeed
    with _$AppImportSeed
    implements AppState, Backable {
  factory AppImportSeed({BaseState base, AppState pstate, String address}) =
      _AppImportSeed;
}

@freezed
abstract class AppAccountSetup with _$AppAccountSetup implements AppState {
  factory AppAccountSetup({BaseState base}) = _AppAccountSetup;
}
