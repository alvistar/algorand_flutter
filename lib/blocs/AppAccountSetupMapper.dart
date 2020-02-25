import 'package:algorand_flutter/blocs/app_state.dart';
import 'package:dart_algorand/dart_algorand.dart';

import 'app_event.dart';
import 'mapper.dart';

class AppAccountSetupMapper with Mapper {
  Stream<AppState> mapAppAccountSetupToState(
      AppEvent event, AppAccountSetup state) async* {
    if (event is AppImportSeedShow) {
      yield AppImportSeed(base: state.base, pstate: state);
    } else if (event is AppSeedGenerate) {
      yield AppSeed(
          base: state.base.copyWith(account: generate_account()),
          pstate: state,
          forwardable: true);
    } else {
      throw UnimplementedError('$event not handled in $state');
    }
  }
}
