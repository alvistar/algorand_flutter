// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$HomeState {
  int get balance;
  String get unit;
  @Default(const <String>[])
  List<String> get assets;
  @Default(const [])
  List<dynamic> get transactions;
  String get currentAsset;

  HomeState copyWith(
      {int balance,
      String unit,
      @Default(const <String>[]) List<String> assets,
      @Default(const []) List<dynamic> transactions,
      String currentAsset});

  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(
        int balance,
        String unit,
        @Default(const <String>[]) List<String> assets,
        @Default(const []) List<dynamic> transactions,
        String currentAsset), {
    @required
        Result SendSheetState(
            int balance,
            String unit,
            List<String> assets,
            List<dynamic> transactions,
            String currentAsset,
            int destAmount,
            String destAddress),
    @required
        Result MantaSheetState(
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
        int balance,
        String unit,
        @Default(const <String>[]) List<String> assets,
        @Default(const []) List<dynamic> transactions,
        String currentAsset), {
    Result SendSheetState(
        int balance,
        String unit,
        List<String> assets,
        List<dynamic> transactions,
        String currentAsset,
        int destAmount,
        String destAddress),
    Result MantaSheetState(
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
      {this.balance,
      this.unit,
      @Default(const <String>[]) this.assets = const <String>[],
      @Default(const []) this.transactions = const [],
      this.currentAsset});

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
    return 'HomeState(balance: $balance, unit: $unit, assets: $assets, transactions: $transactions, currentAsset: $currentAsset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HomeInitialState &&
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
      const DeepCollectionEquality().hash(balance) ^
      const DeepCollectionEquality().hash(unit) ^
      const DeepCollectionEquality().hash(assets) ^
      const DeepCollectionEquality().hash(transactions) ^
      const DeepCollectionEquality().hash(currentAsset);

  @override
  _$HomeInitialState copyWith({
    Object balance = freezed,
    Object unit = freezed,
    Object assets = freezed,
    Object transactions = freezed,
    Object currentAsset = freezed,
  }) {
    return _$HomeInitialState(
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
        int balance,
        String unit,
        @Default(const <String>[]) List<String> assets,
        @Default(const []) List<dynamic> transactions,
        String currentAsset), {
    @required
        Result SendSheetState(
            int balance,
            String unit,
            List<String> assets,
            List<dynamic> transactions,
            String currentAsset,
            int destAmount,
            String destAddress),
    @required
        Result MantaSheetState(
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
    return $default(balance, unit, assets, transactions, currentAsset);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(
        int balance,
        String unit,
        @Default(const <String>[]) List<String> assets,
        @Default(const []) List<dynamic> transactions,
        String currentAsset), {
    Result SendSheetState(
        int balance,
        String unit,
        List<String> assets,
        List<dynamic> transactions,
        String currentAsset,
        int destAmount,
        String destAddress),
    Result MantaSheetState(
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
      return $default(balance, unit, assets, transactions, currentAsset);
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
      {int balance,
      String unit,
      @Default(const <String>[]) List<String> assets,
      @Default(const []) List<dynamic> transactions,
      String currentAsset}) = _$HomeInitialState;

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
      {int balance,
      String unit,
      @Default(const <String>[]) List<String> assets,
      @Default(const []) List<dynamic> transactions,
      String currentAsset});
}

class _$HomeSendSheetState implements HomeSendSheetState {
  _$HomeSendSheetState(
      {this.balance,
      this.unit,
      this.assets,
      this.transactions,
      this.currentAsset,
      this.destAmount,
      this.destAddress});

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
    return 'HomeState.SendSheetState(balance: $balance, unit: $unit, assets: $assets, transactions: $transactions, currentAsset: $currentAsset, destAmount: $destAmount, destAddress: $destAddress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HomeSendSheetState &&
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
      const DeepCollectionEquality().hash(balance) ^
      const DeepCollectionEquality().hash(unit) ^
      const DeepCollectionEquality().hash(assets) ^
      const DeepCollectionEquality().hash(transactions) ^
      const DeepCollectionEquality().hash(currentAsset) ^
      const DeepCollectionEquality().hash(destAmount) ^
      const DeepCollectionEquality().hash(destAddress);

  @override
  _$HomeSendSheetState copyWith({
    Object balance = freezed,
    Object unit = freezed,
    Object assets = freezed,
    Object transactions = freezed,
    Object currentAsset = freezed,
    Object destAmount = freezed,
    Object destAddress = freezed,
  }) {
    return _$HomeSendSheetState(
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
        int balance,
        String unit,
        @Default(const <String>[]) List<String> assets,
        @Default(const []) List<dynamic> transactions,
        String currentAsset), {
    @required
        Result SendSheetState(
            int balance,
            String unit,
            List<String> assets,
            List<dynamic> transactions,
            String currentAsset,
            int destAmount,
            String destAddress),
    @required
        Result MantaSheetState(
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
    return SendSheetState(balance, unit, assets, transactions, currentAsset,
        destAmount, destAddress);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(
        int balance,
        String unit,
        @Default(const <String>[]) List<String> assets,
        @Default(const []) List<dynamic> transactions,
        String currentAsset), {
    Result SendSheetState(
        int balance,
        String unit,
        List<String> assets,
        List<dynamic> transactions,
        String currentAsset,
        int destAmount,
        String destAddress),
    Result MantaSheetState(
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
      return SendSheetState(balance, unit, assets, transactions, currentAsset,
          destAmount, destAddress);
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
      {int balance,
      String unit,
      List<String> assets,
      List<dynamic> transactions,
      String currentAsset,
      int destAmount,
      String destAddress}) = _$HomeSendSheetState;

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
      {int balance,
      String unit,
      List<String> assets,
      List<dynamic> transactions,
      String currentAsset,
      int destAmount,
      String destAddress});
}

class _$HomeMantaSheetState implements HomeMantaSheetState {
  _$HomeMantaSheetState(
      {this.balance,
      this.unit,
      this.assets,
      this.transactions,
      this.currentAsset,
      this.merchant,
      this.destination});

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
    return 'HomeState.MantaSheetState(balance: $balance, unit: $unit, assets: $assets, transactions: $transactions, currentAsset: $currentAsset, merchant: $merchant, destination: $destination)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HomeMantaSheetState &&
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
      const DeepCollectionEquality().hash(balance) ^
      const DeepCollectionEquality().hash(unit) ^
      const DeepCollectionEquality().hash(assets) ^
      const DeepCollectionEquality().hash(transactions) ^
      const DeepCollectionEquality().hash(currentAsset) ^
      const DeepCollectionEquality().hash(merchant) ^
      const DeepCollectionEquality().hash(destination);

  @override
  _$HomeMantaSheetState copyWith({
    Object balance = freezed,
    Object unit = freezed,
    Object assets = freezed,
    Object transactions = freezed,
    Object currentAsset = freezed,
    Object merchant = freezed,
    Object destination = freezed,
  }) {
    return _$HomeMantaSheetState(
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
        int balance,
        String unit,
        @Default(const <String>[]) List<String> assets,
        @Default(const []) List<dynamic> transactions,
        String currentAsset), {
    @required
        Result SendSheetState(
            int balance,
            String unit,
            List<String> assets,
            List<dynamic> transactions,
            String currentAsset,
            int destAmount,
            String destAddress),
    @required
        Result MantaSheetState(
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
    return MantaSheetState(balance, unit, assets, transactions, currentAsset,
        merchant, destination);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(
        int balance,
        String unit,
        @Default(const <String>[]) List<String> assets,
        @Default(const []) List<dynamic> transactions,
        String currentAsset), {
    Result SendSheetState(
        int balance,
        String unit,
        List<String> assets,
        List<dynamic> transactions,
        String currentAsset,
        int destAmount,
        String destAddress),
    Result MantaSheetState(
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
      return MantaSheetState(balance, unit, assets, transactions, currentAsset,
          merchant, destination);
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
      {int balance,
      String unit,
      List<String> assets,
      List<dynamic> transactions,
      String currentAsset,
      Merchant merchant,
      Destination destination}) = _$HomeMantaSheetState;

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
      {int balance,
      String unit,
      List<String> assets,
      List<dynamic> transactions,
      String currentAsset,
      Merchant merchant,
      Destination destination});
}

mixin _$NewSeedState {
  String get address;
  String get privateKey;

  ShowSeedState copyWith({String address, String privateKey});
}

class _$_NewSeedState implements _ShowSeedState {
  _$_NewSeedState({this.address, this.privateKey});

  @override
  final String address;
  @override
  final String privateKey;

  @override
  String toString() {
    return 'NewSeedState(address: $address, privateKey: $privateKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ShowSeedState &&
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
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(privateKey);

  @override
  _$_NewSeedState copyWith({
    Object address = freezed,
    Object privateKey = freezed,
  }) {
    return _$_NewSeedState(
      address: address == freezed ? this.address : address as String,
      privateKey:
          privateKey == freezed ? this.privateKey : privateKey as String,
    );
  }
}

abstract class _ShowSeedState implements ShowSeedState {
  factory _ShowSeedState({String address, String privateKey}) = _$_NewSeedState;

  @override
  String get address;
  @override
  String get privateKey;

  @override
  _ShowSeedState copyWith({String address, String privateKey});
}
