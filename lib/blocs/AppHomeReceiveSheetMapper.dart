import 'package:algorand_flutter/blocs/app_state.dart';

import 'app_event.dart';
import 'mapper.dart';

class AppHomeReceiveSheetMapper with Mapper {
  Stream<AppState> mapAppHomeReceiveSheetToState(
      AppEvent event, AppHomeReceiveSheet state) async* {
    if (event is AppReceiveSheetDismissed) {
      yield state.toInitialState();
    } else {
      throw UnimplementedError('$event not handled in $state');
    }
  }
}
