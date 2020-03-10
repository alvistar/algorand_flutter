import 'package:algorand_flutter/blocs/app_state.dart';

import 'app_event.dart';
import 'mapper.dart';

class AppHomeMantaSheetMapper with Mapper {
  Stream<AppState> mapAppHomeMantaSheetToState(
      AppEvent event, AppHomeMantaSheet state) async* {
    if (event is AppMantaSheetDismissed) {
      yield state.toSendSheet();
    } else if (event is AppSend) {
      yield* mapGlobalEventToState(event);
      // Let be handled by main mapEventToState
    } else {
      throw UnimplementedError('$event not handled in $state');
    }
  }
}
