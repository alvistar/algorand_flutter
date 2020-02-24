import 'app_state.dart';

abstract class Mapper<S, E> {
  final E event;
  final S state;

  Mapper(this.event, this.state);

  Stream<AppState> map();

}