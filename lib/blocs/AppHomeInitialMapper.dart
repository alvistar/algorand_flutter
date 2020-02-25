import 'package:algorand_flutter/blocs/utils.dart';

import 'app_event.dart';
import 'app_state.dart';
import 'mapper.dart';

class AppHomeInitialMapper with Mapper {
  Stream<AppState> mapAppHomeInitialToState(
      AppEvent event, AppHomeInitial state) async* {
    if (event is AppAccountInfoUpdate) {
      yield* _mapAccountInfoUpdateToState(event, state);
    } else if (event is AppAssetChanged) {
      final asset = event.asset;
      yield state.copyWith(
          balance: getBalance(asset: asset, account: state.base.accountInfo),
          currentAsset: asset);
    } else if (event is AppTransactionsUpdate) {
      yield state.copyWith(transactions: event.transactions);
    } else if (event is AppSettingsShow) {
      yield AppSettings(base: state.base, pstate: state);
    } else if (event is AppSendSheetShow) {
      yield state.toSendSheet();
    } else {
      throw UnimplementedError('$event not handled in $state');
    }
  }

  Stream<AppState> _mapAccountInfoUpdateToState(
      AppAccountInfoUpdate event, AppHomeInitial state) async* {
    final assets = {'algo': -1};

    for (String index in event.account.assets.keys) {
      final assetInfo =
          await this.appBloc.repository.getAssetInformation(int.parse(index));
      assets[assetInfo.unitname] = int.parse(index);
    }

    // assets.addAll(getAssets(event.account));
    final newBase = state.base.copyWith(accountInfo: event.account);

    yield state.copyWith(
        base: newBase,
        balance: getBalance(
            asset: state.currentAsset, account: event.account),
        assets: assets);
  }
}
