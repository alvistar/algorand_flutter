import 'package:algorand_flutter/blocs/app_state.dart';
import 'package:dart_algorand/dart_algorand.dart';

import 'app_event.dart';
import 'mapper.dart';

class AppImportSeedMapper with Mapper {
  Stream<AppState> mapAppImportSeedToState(
      AppEvent event, AppImportSeed state) async* {
    if (event is AppBack) {
      yield state.pstate;
    } else if (event is AppSeedImported) {
      final account = AlgoAccount(
          private_key: to_private_key(event.seed),
          address: to_public_key(event.seed));

      yield AppSeed(
          base: state.base.copyWith(account: account),
          pstate: state,
          forwardable: true);
    } else {
      throw UnimplementedError('$event not handled in $state');
    }
  }
}
