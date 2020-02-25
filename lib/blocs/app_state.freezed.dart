// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$BaseState {
  Account get accountInfo;
  AlgoAccount get account;

  BaseState copyWith({Account accountInfo, AlgoAccount account});
}

class _$_BaseState implements _BaseState {
  _$_BaseState({this.accountInfo, this.account});

  @override
  final Account accountInfo;
  @override
  final AlgoAccount account;

  @override
  String toString() {
    return 'BaseState(accountInfo: $accountInfo, account: $account)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BaseState &&
            (identical(other.accountInfo, accountInfo) ||
                const DeepCollectionEquality()
                    .equals(other.accountInfo, accountInfo)) &&
            (identical(other.account, account) ||
                const DeepCollectionEquality().equals(other.account, account)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(accountInfo) ^
      const DeepCollectionEquality().hash(account);

  @override
  _$_BaseState copyWith({
    Object accountInfo = freezed,
    Object account = freezed,
  }) {
    return _$_BaseState(
      accountInfo:
          accountInfo == freezed ? this.accountInfo : accountInfo as Account,
      account: account == freezed ? this.account : account as AlgoAccount,
    );
  }
}

abstract class _BaseState implements BaseState {
  factory _BaseState({Account accountInfo, AlgoAccount account}) = _$_BaseState;

  @override
  Account get accountInfo;
  @override
  AlgoAccount get account;

  @override
  _BaseState copyWith({Account accountInfo, AlgoAccount account});
}

mixin _$AppHome {
  BaseState get base;
  int get balance;
  String get unit;
  @Default(const <String>[])
  List<String> get assets;
  @Default(const [])
  List<dynamic> get transactions;
  String get currentAsset;

  AppHome copyWith(
      {BaseState base,
      int balance,
      String unit,
      @Default(const <String>[]) List<String> assets,
      @Default(const []) List<dynamic> transactions,
      String currentAsset});

  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(
        BaseState base,
        int balance,
        String unit,
        @Default(const <String>[]) List<String> assets,
        @Default(const []) List<dynamic> transactions,
        String currentAsset), {
    @required
        Result SendSheetState(
            BaseState base,
            int balance,
            String unit,
            List<String> assets,
            List<dynamic> transactions,
            String currentAsset,
            int destAmount,
            String destAddress),
    @required
        Result MantaSheetState(
            BaseState base,
            int balance,
            String unit,
            List<String> assets,
            List<dynamic> transactions,
            String currentAsset,
            Merchant merchant,
            Destination destination),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(
        BaseState base,
        int balance,
        String unit,
        @Default(const <String>[]) List<String> assets,
        @Default(const []) List<dynamic> transactions,
        String currentAsset), {
    Result SendSheetState(
        BaseState base,
        int balance,
        String unit,
        List<String> assets,
        List<dynamic> transactions,
        String currentAsset,
        int destAmount,
        String destAddress),
    Result MantaSheetState(
        BaseState base,
        int balance,
        String unit,
        List<String> assets,
        List<dynamic> transactions,
        String currentAsset,
        Merchant merchant,
        Destination destination),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(AppHomeInitial value), {
    @required Result SendSheetState(AppHomeSendSheet value),
    @required Result MantaSheetState(AppHomeMantaSheet value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(AppHomeInitial value), {
    Result SendSheetState(AppHomeSendSheet value),
    Result MantaSheetState(AppHomeMantaSheet value),
    @required Result orElse(),
  });
}

class _$AppHomeInitial implements AppHomeInitial {
  _$AppHomeInitial(
      {this.base,
      this.balance,
      this.unit,
      @Default(const <String>[]) this.assets = const <String>[],
      @Default(const []) this.transactions = const [],
      this.currentAsset});

  @override
  final BaseState base;
  @override
  final int balance;
  @override
  final String unit;
  @JsonKey(defaultValue: const <String>[])
  @override
  @Default(const <String>[])
  final List<String> assets;
  @JsonKey(defaultValue: const [])
  @override
  @Default(const [])
  final List<dynamic> transactions;
  @override
  final String currentAsset;

  @override
  String toString() {
    return 'AppHome(base: $base, balance: $balance, unit: $unit, assets: $assets, transactions: $transactions, currentAsset: $currentAsset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AppHomeInitial &&
            (identical(other.base, base) ||
                const DeepCollectionEquality().equals(other.base, base)) &&
            (identical(other.balance, balance) ||
                const DeepCollectionEquality()
                    .equals(other.balance, balance)) &&
            (identical(other.unit, unit) ||
                const DeepCollectionEquality().equals(other.unit, unit)) &&
            (identical(other.assets, assets) ||
                const DeepCollectionEquality().equals(other.assets, assets)) &&
            (identical(other.transactions, transactions) ||
                const DeepCollectionEquality()
                    .equals(other.transactions, transactions)) &&
            (identical(other.currentAsset, currentAsset) ||
                const DeepCollectionEquality()
                    .equals(other.currentAsset, currentAsset)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(base) ^
      const DeepCollectionEquality().hash(balance) ^
      const DeepCollectionEquality().hash(unit) ^
      const DeepCollectionEquality().hash(assets) ^
      const DeepCollectionEquality().hash(transactions) ^
      const DeepCollectionEquality().hash(currentAsset);

  @override
  _$AppHomeInitial copyWith({
    Object base = freezed,
    Object balance = freezed,
    Object unit = freezed,
    Object assets = freezed,
    Object transactions = freezed,
    Object currentAsset = freezed,
  }) {
    return _$AppHomeInitial(
      base: base == freezed ? this.base : base as BaseState,
      balance: balance == freezed ? this.balance : balance as int,
      unit: unit == freezed ? this.unit : unit as String,
      assets: assets == freezed ? this.assets : assets as List<String>,
      transactions: transactions == freezed
          ? this.transactions
          : transactions as List<dynamic>,
      currentAsset:
          currentAsset == freezed ? this.currentAsset : currentAsset as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(
        BaseState base,
        int balance,
        String unit,
        @Default(const <String>[]) List<String> assets,
        @Default(const []) List<dynamic> transactions,
        String currentAsset), {
    @required
        Result SendSheetState(
            BaseState base,
            int balance,
            String unit,
            List<String> assets,
            List<dynamic> transactions,
            String currentAsset,
            int destAmount,
            String destAddress),
    @required
        Result MantaSheetState(
            BaseState base,
            int balance,
            String unit,
            List<String> assets,
            List<dynamic> transactions,
            String currentAsset,
            Merchant merchant,
            Destination destination),
  }) {
    assert($default != null);
    assert(SendSheetState != null);
    assert(MantaSheetState != null);
    return $default(base, balance, unit, assets, transactions, currentAsset);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(
        BaseState base,
        int balance,
        String unit,
        @Default(const <String>[]) List<String> assets,
        @Default(const []) List<dynamic> transactions,
        String currentAsset), {
    Result SendSheetState(
        BaseState base,
        int balance,
        String unit,
        List<String> assets,
        List<dynamic> transactions,
        String currentAsset,
        int destAmount,
        String destAddress),
    Result MantaSheetState(
        BaseState base,
        int balance,
        String unit,
        List<String> assets,
        List<dynamic> transactions,
        String currentAsset,
        Merchant merchant,
        Destination destination),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(base, balance, unit, assets, transactions, currentAsset);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(AppHomeInitial value), {
    @required Result SendSheetState(AppHomeSendSheet value),
    @required Result MantaSheetState(AppHomeMantaSheet value),
  }) {
    assert($default != null);
    assert(SendSheetState != null);
    assert(MantaSheetState != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(AppHomeInitial value), {
    Result SendSheetState(AppHomeSendSheet value),
    Result MantaSheetState(AppHomeMantaSheet value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class AppHomeInitial implements AppHome {
  factory AppHomeInitial(
      {BaseState base,
      int balance,
      String unit,
      @Default(const <String>[]) List<String> assets,
      @Default(const []) List<dynamic> transactions,
      String currentAsset}) = _$AppHomeInitial;

  @override
  BaseState get base;
  @override
  int get balance;
  @override
  String get unit;
  @override
  @Default(const <String>[])
  List<String> get assets;
  @override
  @Default(const [])
  List<dynamic> get transactions;
  @override
  String get currentAsset;

  @override
  AppHomeInitial copyWith(
      {BaseState base,
      int balance,
      String unit,
      @Default(const <String>[]) List<String> assets,
      @Default(const []) List<dynamic> transactions,
      String currentAsset});
}

class _$AppHomeSendSheet implements AppHomeSendSheet {
  _$AppHomeSendSheet(
      {this.base,
      this.balance,
      this.unit,
      this.assets,
      this.transactions,
      this.currentAsset,
      this.destAmount,
      this.destAddress});

  @override
  final BaseState base;
  @override
  final int balance;
  @override
  final String unit;
  @override
  final List<String> assets;
  @override
  final List<dynamic> transactions;
  @override
  final String currentAsset;
  @override
  final int destAmount;
  @override
  final String destAddress;

  @override
  String toString() {
    return 'AppHome.SendSheetState(base: $base, balance: $balance, unit: $unit, assets: $assets, transactions: $transactions, currentAsset: $currentAsset, destAmount: $destAmount, destAddress: $destAddress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AppHomeSendSheet &&
            (identical(other.base, base) ||
                const DeepCollectionEquality().equals(other.base, base)) &&
            (identical(other.balance, balance) ||
                const DeepCollectionEquality()
                    .equals(other.balance, balance)) &&
            (identical(other.unit, unit) ||
                const DeepCollectionEquality().equals(other.unit, unit)) &&
            (identical(other.assets, assets) ||
                const DeepCollectionEquality().equals(other.assets, assets)) &&
            (identical(other.transactions, transactions) ||
                const DeepCollectionEquality()
                    .equals(other.transactions, transactions)) &&
            (identical(other.currentAsset, currentAsset) ||
                const DeepCollectionEquality()
                    .equals(other.currentAsset, currentAsset)) &&
            (identical(other.destAmount, destAmount) ||
                const DeepCollectionEquality()
                    .equals(other.destAmount, destAmount)) &&
            (identical(other.destAddress, destAddress) ||
                const DeepCollectionEquality()
                    .equals(other.destAddress, destAddress)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(base) ^
      const DeepCollectionEquality().hash(balance) ^
      const DeepCollectionEquality().hash(unit) ^
      const DeepCollectionEquality().hash(assets) ^
      const DeepCollectionEquality().hash(transactions) ^
      const DeepCollectionEquality().hash(currentAsset) ^
      const DeepCollectionEquality().hash(destAmount) ^
      const DeepCollectionEquality().hash(destAddress);

  @override
  _$AppHomeSendSheet copyWith({
    Object base = freezed,
    Object balance = freezed,
    Object unit = freezed,
    Object assets = freezed,
    Object transactions = freezed,
    Object currentAsset = freezed,
    Object destAmount = freezed,
    Object destAddress = freezed,
  }) {
    return _$AppHomeSendSheet(
      base: base == freezed ? this.base : base as BaseState,
      balance: balance == freezed ? this.balance : balance as int,
      unit: unit == freezed ? this.unit : unit as String,
      assets: assets == freezed ? this.assets : assets as List<String>,
      transactions: transactions == freezed
          ? this.transactions
          : transactions as List<dynamic>,
      currentAsset:
          currentAsset == freezed ? this.currentAsset : currentAsset as String,
      destAmount: destAmount == freezed ? this.destAmount : destAmount as int,
      destAddress:
          destAddress == freezed ? this.destAddress : destAddress as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(
        BaseState base,
        int balance,
        String unit,
        @Default(const <String>[]) List<String> assets,
        @Default(const []) List<dynamic> transactions,
        String currentAsset), {
    @required
        Result SendSheetState(
            BaseState base,
            int balance,
            String unit,
            List<String> assets,
            List<dynamic> transactions,
            String currentAsset,
            int destAmount,
            String destAddress),
    @required
        Result MantaSheetState(
            BaseState base,
            int balance,
            String unit,
            List<String> assets,
            List<dynamic> transactions,
            String currentAsset,
            Merchant merchant,
            Destination destination),
  }) {
    assert($default != null);
    assert(SendSheetState != null);
    assert(MantaSheetState != null);
    return SendSheetState(base, balance, unit, assets, transactions,
        currentAsset, destAmount, destAddress);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(
        BaseState base,
        int balance,
        String unit,
        @Default(const <String>[]) List<String> assets,
        @Default(const []) List<dynamic> transactions,
        String currentAsset), {
    Result SendSheetState(
        BaseState base,
        int balance,
        String unit,
        List<String> assets,
        List<dynamic> transactions,
        String currentAsset,
        int destAmount,
        String destAddress),
    Result MantaSheetState(
        BaseState base,
        int balance,
        String unit,
        List<String> assets,
        List<dynamic> transactions,
        String currentAsset,
        Merchant merchant,
        Destination destination),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (SendSheetState != null) {
      return SendSheetState(base, balance, unit, assets, transactions,
          currentAsset, destAmount, destAddress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(AppHomeInitial value), {
    @required Result SendSheetState(AppHomeSendSheet value),
    @required Result MantaSheetState(AppHomeMantaSheet value),
  }) {
    assert($default != null);
    assert(SendSheetState != null);
    assert(MantaSheetState != null);
    return SendSheetState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(AppHomeInitial value), {
    Result SendSheetState(AppHomeSendSheet value),
    Result MantaSheetState(AppHomeMantaSheet value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (SendSheetState != null) {
      return SendSheetState(this);
    }
    return orElse();
  }
}

abstract class AppHomeSendSheet implements AppHome {
  factory AppHomeSendSheet(
      {BaseState base,
      int balance,
      String unit,
      List<String> assets,
      List<dynamic> transactions,
      String currentAsset,
      int destAmount,
      String destAddress}) = _$AppHomeSendSheet;

  @override
  BaseState get base;
  @override
  int get balance;
  @override
  String get unit;
  @override
  List<String> get assets;
  @override
  List<dynamic> get transactions;
  @override
  String get currentAsset;
  int get destAmount;
  String get destAddress;

  @override
  AppHomeSendSheet copyWith(
      {BaseState base,
      int balance,
      String unit,
      List<String> assets,
      List<dynamic> transactions,
      String currentAsset,
      int destAmount,
      String destAddress});
}

class _$AppHomeMantaSheet implements AppHomeMantaSheet {
  _$AppHomeMantaSheet(
      {this.base,
      this.balance,
      this.unit,
      this.assets,
      this.transactions,
      this.currentAsset,
      this.merchant,
      this.destination});

  @override
  final BaseState base;
  @override
  final int balance;
  @override
  final String unit;
  @override
  final List<String> assets;
  @override
  final List<dynamic> transactions;
  @override
  final String currentAsset;
  @override
  final Merchant merchant;
  @override
  final Destination destination;

  @override
  String toString() {
    return 'AppHome.MantaSheetState(base: $base, balance: $balance, unit: $unit, assets: $assets, transactions: $transactions, currentAsset: $currentAsset, merchant: $merchant, destination: $destination)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AppHomeMantaSheet &&
            (identical(other.base, base) ||
                const DeepCollectionEquality().equals(other.base, base)) &&
            (identical(other.balance, balance) ||
                const DeepCollectionEquality()
                    .equals(other.balance, balance)) &&
            (identical(other.unit, unit) ||
                const DeepCollectionEquality().equals(other.unit, unit)) &&
            (identical(other.assets, assets) ||
                const DeepCollectionEquality().equals(other.assets, assets)) &&
            (identical(other.transactions, transactions) ||
                const DeepCollectionEquality()
                    .equals(other.transactions, transactions)) &&
            (identical(other.currentAsset, currentAsset) ||
                const DeepCollectionEquality()
                    .equals(other.currentAsset, currentAsset)) &&
            (identical(other.merchant, merchant) ||
                const DeepCollectionEquality()
                    .equals(other.merchant, merchant)) &&
            (identical(other.destination, destination) ||
                const DeepCollectionEquality()
                    .equals(other.destination, destination)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(base) ^
      const DeepCollectionEquality().hash(balance) ^
      const DeepCollectionEquality().hash(unit) ^
      const DeepCollectionEquality().hash(assets) ^
      const DeepCollectionEquality().hash(transactions) ^
      const DeepCollectionEquality().hash(currentAsset) ^
      const DeepCollectionEquality().hash(merchant) ^
      const DeepCollectionEquality().hash(destination);

  @override
  _$AppHomeMantaSheet copyWith({
    Object base = freezed,
    Object balance = freezed,
    Object unit = freezed,
    Object assets = freezed,
    Object transactions = freezed,
    Object currentAsset = freezed,
    Object merchant = freezed,
    Object destination = freezed,
  }) {
    return _$AppHomeMantaSheet(
      base: base == freezed ? this.base : base as BaseState,
      balance: balance == freezed ? this.balance : balance as int,
      unit: unit == freezed ? this.unit : unit as String,
      assets: assets == freezed ? this.assets : assets as List<String>,
      transactions: transactions == freezed
          ? this.transactions
          : transactions as List<dynamic>,
      currentAsset:
          currentAsset == freezed ? this.currentAsset : currentAsset as String,
      merchant: merchant == freezed ? this.merchant : merchant as Merchant,
      destination: destination == freezed
          ? this.destination
          : destination as Destination,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(
        BaseState base,
        int balance,
        String unit,
        @Default(const <String>[]) List<String> assets,
        @Default(const []) List<dynamic> transactions,
        String currentAsset), {
    @required
        Result SendSheetState(
            BaseState base,
            int balance,
            String unit,
            List<String> assets,
            List<dynamic> transactions,
            String currentAsset,
            int destAmount,
            String destAddress),
    @required
        Result MantaSheetState(
            BaseState base,
            int balance,
            String unit,
            List<String> assets,
            List<dynamic> transactions,
            String currentAsset,
            Merchant merchant,
            Destination destination),
  }) {
    assert($default != null);
    assert(SendSheetState != null);
    assert(MantaSheetState != null);
    return MantaSheetState(base, balance, unit, assets, transactions,
        currentAsset, merchant, destination);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(
        BaseState base,
        int balance,
        String unit,
        @Default(const <String>[]) List<String> assets,
        @Default(const []) List<dynamic> transactions,
        String currentAsset), {
    Result SendSheetState(
        BaseState base,
        int balance,
        String unit,
        List<String> assets,
        List<dynamic> transactions,
        String currentAsset,
        int destAmount,
        String destAddress),
    Result MantaSheetState(
        BaseState base,
        int balance,
        String unit,
        List<String> assets,
        List<dynamic> transactions,
        String currentAsset,
        Merchant merchant,
        Destination destination),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (MantaSheetState != null) {
      return MantaSheetState(base, balance, unit, assets, transactions,
          currentAsset, merchant, destination);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(AppHomeInitial value), {
    @required Result SendSheetState(AppHomeSendSheet value),
    @required Result MantaSheetState(AppHomeMantaSheet value),
  }) {
    assert($default != null);
    assert(SendSheetState != null);
    assert(MantaSheetState != null);
    return MantaSheetState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(AppHomeInitial value), {
    Result SendSheetState(AppHomeSendSheet value),
    Result MantaSheetState(AppHomeMantaSheet value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (MantaSheetState != null) {
      return MantaSheetState(this);
    }
    return orElse();
  }
}

abstract class AppHomeMantaSheet implements AppHome {
  factory AppHomeMantaSheet(
      {BaseState base,
      int balance,
      String unit,
      List<String> assets,
      List<dynamic> transactions,
      String currentAsset,
      Merchant merchant,
      Destination destination}) = _$AppHomeMantaSheet;

  @override
  BaseState get base;
  @override
  int get balance;
  @override
  String get unit;
  @override
  List<String> get assets;
  @override
  List<dynamic> get transactions;
  @override
  String get currentAsset;
  Merchant get merchant;
  Destination get destination;

  @override
  AppHomeMantaSheet copyWith(
      {BaseState base,
      int balance,
      String unit,
      List<String> assets,
      List<dynamic> transactions,
      String currentAsset,
      Merchant merchant,
      Destination destination});
}

mixin _$AppSeed {
  BaseState get base;
  AppState get pstate;

  AppSeed copyWith({BaseState base, AppState pstate});
}

class _$_AppSeed implements _AppSeed {
  _$_AppSeed({this.base, this.pstate});

  @override
  final BaseState base;
  @override
  final AppState pstate;

  @override
  String toString() {
    return 'AppSeed(base: $base, pstate: $pstate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppSeed &&
            (identical(other.base, base) ||
                const DeepCollectionEquality().equals(other.base, base)) &&
            (identical(other.pstate, pstate) ||
                const DeepCollectionEquality().equals(other.pstate, pstate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(base) ^
      const DeepCollectionEquality().hash(pstate);

  @override
  _$_AppSeed copyWith({
    Object base = freezed,
    Object pstate = freezed,
  }) {
    return _$_AppSeed(
      base: base == freezed ? this.base : base as BaseState,
      pstate: pstate == freezed ? this.pstate : pstate as AppState,
    );
  }
}

abstract class _AppSeed implements AppSeed {
  factory _AppSeed({BaseState base, AppState pstate}) = _$_AppSeed;

  @override
  BaseState get base;
  @override
  AppState get pstate;

  @override
  _AppSeed copyWith({BaseState base, AppState pstate});
}

mixin _$AppSettings {
  BaseState get base;
  AppState get pstate;

  AppSettings copyWith({BaseState base, AppState pstate});
}

class _$_AppSettings implements _AppSettings {
  _$_AppSettings({this.base, this.pstate});

  @override
  final BaseState base;
  @override
  final AppState pstate;

  @override
  String toString() {
    return 'AppSettings(base: $base, pstate: $pstate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppSettings &&
            (identical(other.base, base) ||
                const DeepCollectionEquality().equals(other.base, base)) &&
            (identical(other.pstate, pstate) ||
                const DeepCollectionEquality().equals(other.pstate, pstate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(base) ^
      const DeepCollectionEquality().hash(pstate);

  @override
  _$_AppSettings copyWith({
    Object base = freezed,
    Object pstate = freezed,
  }) {
    return _$_AppSettings(
      base: base == freezed ? this.base : base as BaseState,
      pstate: pstate == freezed ? this.pstate : pstate as AppState,
    );
  }
}

abstract class _AppSettings implements AppSettings {
  factory _AppSettings({BaseState base, AppState pstate}) = _$_AppSettings;

  @override
  BaseState get base;
  @override
  AppState get pstate;

  @override
  _AppSettings copyWith({BaseState base, AppState pstate});
}

mixin _$AppImportSeed {
  BaseState get base;
  AppState get pstate;
  String get address;

  AppImportSeed copyWith({BaseState base, AppState pstate, String address});
}

class _$_AppImportSeed implements _AppImportSeed {
  _$_AppImportSeed({this.base, this.pstate, this.address});

  @override
  final BaseState base;
  @override
  final AppState pstate;
  @override
  final String address;

  @override
  String toString() {
    return 'AppImportSeed(base: $base, pstate: $pstate, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppImportSeed &&
            (identical(other.base, base) ||
                const DeepCollectionEquality().equals(other.base, base)) &&
            (identical(other.pstate, pstate) ||
                const DeepCollectionEquality().equals(other.pstate, pstate)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality().equals(other.address, address)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(base) ^
      const DeepCollectionEquality().hash(pstate) ^
      const DeepCollectionEquality().hash(address);

  @override
  _$_AppImportSeed copyWith({
    Object base = freezed,
    Object pstate = freezed,
    Object address = freezed,
  }) {
    return _$_AppImportSeed(
      base: base == freezed ? this.base : base as BaseState,
      pstate: pstate == freezed ? this.pstate : pstate as AppState,
      address: address == freezed ? this.address : address as String,
    );
  }
}

abstract class _AppImportSeed implements AppImportSeed {
  factory _AppImportSeed({BaseState base, AppState pstate, String address}) =
      _$_AppImportSeed;

  @override
  BaseState get base;
  @override
  AppState get pstate;
  @override
  String get address;

  @override
  _AppImportSeed copyWith({BaseState base, AppState pstate, String address});
}
