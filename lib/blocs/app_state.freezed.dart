// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$BaseState {}

class _$_BaseState implements _BaseState {
  _$_BaseState();

  @override
  String toString() {
    return 'BaseState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _BaseState);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _BaseState implements BaseState {
  factory _BaseState() = _$_BaseState;
}

mixin _$HomeState {
  BaseState get base;
  int get balance;
  String get unit;
  @Default(const <String>[])
  List<String> get assets;
  @Default(const [])
  List<dynamic> get transactions;
  String get currentAsset;

  HomeState copyWith(
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
    Result $default(HomeInitialState value), {
    @required Result SendSheetState(HomeSendSheetState value),
    @required Result MantaSheetState(HomeMantaSheetState value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(HomeInitialState value), {
    Result SendSheetState(HomeSendSheetState value),
    Result MantaSheetState(HomeMantaSheetState value),
    @required Result orElse(),
  });
}

class _$HomeInitialState implements HomeInitialState {
  _$HomeInitialState(
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
    return 'HomeState(base: $base, balance: $balance, unit: $unit, assets: $assets, transactions: $transactions, currentAsset: $currentAsset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HomeInitialState &&
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
  _$HomeInitialState copyWith({
    Object base = freezed,
    Object balance = freezed,
    Object unit = freezed,
    Object assets = freezed,
    Object transactions = freezed,
    Object currentAsset = freezed,
  }) {
    return _$HomeInitialState(
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
    Result $default(HomeInitialState value), {
    @required Result SendSheetState(HomeSendSheetState value),
    @required Result MantaSheetState(HomeMantaSheetState value),
  }) {
    assert($default != null);
    assert(SendSheetState != null);
    assert(MantaSheetState != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(HomeInitialState value), {
    Result SendSheetState(HomeSendSheetState value),
    Result MantaSheetState(HomeMantaSheetState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class HomeInitialState implements HomeState {
  factory HomeInitialState(
      {BaseState base,
      int balance,
      String unit,
      @Default(const <String>[]) List<String> assets,
      @Default(const []) List<dynamic> transactions,
      String currentAsset}) = _$HomeInitialState;

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
  HomeInitialState copyWith(
      {BaseState base,
      int balance,
      String unit,
      @Default(const <String>[]) List<String> assets,
      @Default(const []) List<dynamic> transactions,
      String currentAsset});
}

class _$HomeSendSheetState implements HomeSendSheetState {
  _$HomeSendSheetState(
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
    return 'HomeState.SendSheetState(base: $base, balance: $balance, unit: $unit, assets: $assets, transactions: $transactions, currentAsset: $currentAsset, destAmount: $destAmount, destAddress: $destAddress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HomeSendSheetState &&
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
  _$HomeSendSheetState copyWith({
    Object base = freezed,
    Object balance = freezed,
    Object unit = freezed,
    Object assets = freezed,
    Object transactions = freezed,
    Object currentAsset = freezed,
    Object destAmount = freezed,
    Object destAddress = freezed,
  }) {
    return _$HomeSendSheetState(
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
    Result $default(HomeInitialState value), {
    @required Result SendSheetState(HomeSendSheetState value),
    @required Result MantaSheetState(HomeMantaSheetState value),
  }) {
    assert($default != null);
    assert(SendSheetState != null);
    assert(MantaSheetState != null);
    return SendSheetState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(HomeInitialState value), {
    Result SendSheetState(HomeSendSheetState value),
    Result MantaSheetState(HomeMantaSheetState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (SendSheetState != null) {
      return SendSheetState(this);
    }
    return orElse();
  }
}

abstract class HomeSendSheetState implements HomeState {
  factory HomeSendSheetState(
      {BaseState base,
      int balance,
      String unit,
      List<String> assets,
      List<dynamic> transactions,
      String currentAsset,
      int destAmount,
      String destAddress}) = _$HomeSendSheetState;

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
  HomeSendSheetState copyWith(
      {BaseState base,
      int balance,
      String unit,
      List<String> assets,
      List<dynamic> transactions,
      String currentAsset,
      int destAmount,
      String destAddress});
}

class _$HomeMantaSheetState implements HomeMantaSheetState {
  _$HomeMantaSheetState(
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
    return 'HomeState.MantaSheetState(base: $base, balance: $balance, unit: $unit, assets: $assets, transactions: $transactions, currentAsset: $currentAsset, merchant: $merchant, destination: $destination)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HomeMantaSheetState &&
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
  _$HomeMantaSheetState copyWith({
    Object base = freezed,
    Object balance = freezed,
    Object unit = freezed,
    Object assets = freezed,
    Object transactions = freezed,
    Object currentAsset = freezed,
    Object merchant = freezed,
    Object destination = freezed,
  }) {
    return _$HomeMantaSheetState(
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
    Result $default(HomeInitialState value), {
    @required Result SendSheetState(HomeSendSheetState value),
    @required Result MantaSheetState(HomeMantaSheetState value),
  }) {
    assert($default != null);
    assert(SendSheetState != null);
    assert(MantaSheetState != null);
    return MantaSheetState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(HomeInitialState value), {
    Result SendSheetState(HomeSendSheetState value),
    Result MantaSheetState(HomeMantaSheetState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (MantaSheetState != null) {
      return MantaSheetState(this);
    }
    return orElse();
  }
}

abstract class HomeMantaSheetState implements HomeState {
  factory HomeMantaSheetState(
      {BaseState base,
      int balance,
      String unit,
      List<String> assets,
      List<dynamic> transactions,
      String currentAsset,
      Merchant merchant,
      Destination destination}) = _$HomeMantaSheetState;

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
  HomeMantaSheetState copyWith(
      {BaseState base,
      int balance,
      String unit,
      List<String> assets,
      List<dynamic> transactions,
      String currentAsset,
      Merchant merchant,
      Destination destination});
}

mixin _$ShowSeedState {
  BaseState get base;
  String get address;
  String get privateKey;

  ShowSeedState copyWith({BaseState base, String address, String privateKey});
}

class _$_ShowSeedState implements _ShowSeedState {
  _$_ShowSeedState({this.base, this.address, this.privateKey});

  @override
  final BaseState base;
  @override
  final String address;
  @override
  final String privateKey;

  @override
  String toString() {
    return 'ShowSeedState(base: $base, address: $address, privateKey: $privateKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ShowSeedState &&
            (identical(other.base, base) ||
                const DeepCollectionEquality().equals(other.base, base)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.privateKey, privateKey) ||
                const DeepCollectionEquality()
                    .equals(other.privateKey, privateKey)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(base) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(privateKey);

  @override
  _$_ShowSeedState copyWith({
    Object base = freezed,
    Object address = freezed,
    Object privateKey = freezed,
  }) {
    return _$_ShowSeedState(
      base: base == freezed ? this.base : base as BaseState,
      address: address == freezed ? this.address : address as String,
      privateKey:
          privateKey == freezed ? this.privateKey : privateKey as String,
    );
  }
}

abstract class _ShowSeedState implements ShowSeedState {
  factory _ShowSeedState({BaseState base, String address, String privateKey}) =
      _$_ShowSeedState;

  @override
  BaseState get base;
  @override
  String get address;
  @override
  String get privateKey;

  @override
  _ShowSeedState copyWith({BaseState base, String address, String privateKey});
}

mixin _$SettingsState {
  BaseState get base;
  AppState get pstate;
  String get address;

  SettingsState copyWith({BaseState base, AppState pstate, String address});
}

class _$_SettingsState implements _SettingsState {
  _$_SettingsState({this.base, this.pstate, this.address});

  @override
  final BaseState base;
  @override
  final AppState pstate;
  @override
  final String address;

  @override
  String toString() {
    return 'SettingsState(base: $base, pstate: $pstate, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SettingsState &&
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
  _$_SettingsState copyWith({
    Object base = freezed,
    Object pstate = freezed,
    Object address = freezed,
  }) {
    return _$_SettingsState(
      base: base == freezed ? this.base : base as BaseState,
      pstate: pstate == freezed ? this.pstate : pstate as AppState,
      address: address == freezed ? this.address : address as String,
    );
  }
}

abstract class _SettingsState implements SettingsState {
  factory _SettingsState({BaseState base, AppState pstate, String address}) =
      _$_SettingsState;

  @override
  BaseState get base;
  @override
  AppState get pstate;
  @override
  String get address;

  @override
  _SettingsState copyWith({BaseState base, AppState pstate, String address});
}
