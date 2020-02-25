import 'app_bloc.dart';
import 'app_event.dart';
import 'app_state.dart';

mixin Mapper {
  AppBloc get appBloc {throw UnimplementedError(); }
  Stream<AppState> mapGlobalEventToState(AppEvent event) {
    throw UnimplementedError();
  }
}