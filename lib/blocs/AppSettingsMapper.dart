import 'package:algorand_flutter/blocs/app_state.dart';

import 'app_event.dart';
import 'mapper.dart';

class AppSettingsMapper with Mapper {

  Stream<AppState> mapAppSettingsToState(AppEvent event,
      AppSettings state) async* {
    if (event is AppBack) {
      yield state.pstate;
    } else if (event is AppImportSeedShow) {
      yield AppImportSeed(base:state.base, pstate: state);
    }
    else {
      throw UnimplementedError('$event not handled in $state');
    }
  }
}