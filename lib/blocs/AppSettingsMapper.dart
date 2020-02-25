import 'package:algorand_flutter/blocs/app_state.dart';
import 'package:algorand_flutter/ui/account_setup.dart';

import 'app_event.dart';
import 'mapper.dart';

class AppSettingsMapper with Mapper {

  Stream<AppState> mapAppSettingsToState(AppEvent event,
      AppSettings state) async* {
    if (event is AppBack) {
      yield state.pstate;
    } else if (event is AppSeedReset) {
      this.appBloc.configuration.reset_account();
      yield AppAccountSetup(base: state.base);
    } else if (event is AppSeedShow) {
      yield AppSeed(base: state.base, pstate: state);
    }
    else {
      throw UnimplementedError('$event not handled in $state');
    }
  }
}