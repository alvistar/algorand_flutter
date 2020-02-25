import 'package:algorand_flutter/blocs/app_state.dart';
import 'package:dart_algorand/dart_algorand.dart';

import 'app_event.dart';
import 'mapper.dart';

class AppSeedMapper with Mapper {
  Stream<AppState> mapAppSeedToState(AppEvent event, AppSeed state) async* {
    if (event is AppForward) {
      yield AppHomeInitial(
          base: BaseState(account: state.base.account), currentAsset: 'algo');
    } else if (event is AppBack) {
      yield state.pstate;
    }
    else {
      throw UnimplementedError('$event not handled in $state');
    }
  }
}
