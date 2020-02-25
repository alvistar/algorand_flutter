import 'app_event.dart';
import 'app_state.dart';

mixin Mapper {
  void add(AppEvent event) {
    throw UnimplementedError();
  }
  Stream<AppState> mapGlobalEventToState(AppEvent event) {
    throw UnimplementedError();
  }
}