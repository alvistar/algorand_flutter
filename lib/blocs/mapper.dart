import 'app_event.dart';
import 'app_state.dart';

mixin Mapper {
  Stream<AppState> mapGlobalEventToState(AppEvent event) {
    throw UnimplementedError();
  }
}