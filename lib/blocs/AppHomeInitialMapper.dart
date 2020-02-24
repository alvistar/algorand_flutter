import 'package:algorand_flutter/blocs/utils.dart';

import 'app_event.dart';
import 'app_state.dart';
import 'mapper.dart';

class AppHomeInitialMapper extends Mapper<AppHomeInitial, AppEvent> {
  AppHomeInitialMapper(AppEvent event, AppHomeInitial state)
      : super(event, state);

  Stream<AppState> map() async* {
    if (event is AppAccountInfoUpdate) {
      yield* _mapAccountInfoUpdateToState(event);
    } else if (event is AppAssetChanged) {
      final asset = (event as AppAssetChanged).asset;
      yield state.copyWith(
          balance: getBalance(asset: asset, account: state.base.accountInfo),
          currentAsset: asset);
    } else if (event is AppTransactionsUpdate) {
      yield state.copyWith(
          transactions: (event as AppTransactionsUpdate).transactions);
    } else if (event is AppSendSheetShow) {
      yield state.toSendSheet();
    } else if (event is AppSend) {
      // Let be handled by main mapEventToState
    } else {
      throw UnimplementedError('$event not handled $state');
    }
  }

  Stream<AppState> _mapAccountInfoUpdateToState(
      AppAccountInfoUpdate event) async* {
    final assets = <String>['algo'];
    assets.addAll(getAssets(event.account));
    final newBase = state.base.copyWith(accountInfo: event.account);

    yield state.copyWith(
        base: newBase,
        balance: getBalance(asset: state.currentAsset, account: event.account),
        assets: assets);
  }
}
