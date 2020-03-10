import 'dart:async';

import 'package:dart_algorand/algod/model/account.dart';
import 'package:rxdart/rxdart.dart';

import 'algo_repository.dart';

class AccountStreamProvider {
  final BehaviorSubject _subject = BehaviorSubject<Account>();
  final PublishSubject _addSubject = PublishSubject<void>();
  final AlgoRepository repository;
  final String address;
  Timer timer;

  ValueStream<Account> get stream => _subject.stream;

  _startPeriodicTimer() {
    timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      _addSubject.add(null);
    });
  }

  AccountStreamProvider({this.address, this.repository}) {
    final output = _addSubject.stream.asyncMap((event) {
      print('Updating for account');
      return repository.getAccountInformation(address);
    });

    _subject.addStream(output);

    _addSubject.add(null);

    _subject.onListen = _onListen;

    _subject.onCancel = () async {
      print('cancelling timer');
      timer.cancel();
    };
  }

  _onListen() {
    print('Listening');
    _startPeriodicTimer();
  }
}
