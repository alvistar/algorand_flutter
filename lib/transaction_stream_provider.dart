import 'dart:async';

import 'package:rxdart/rxdart.dart';

import 'algo_repository.dart';

class TransactionStreamProvider {
  final List _transactions = [];
  final BehaviorSubject _subject = BehaviorSubject<List>();
  final PublishSubject _addSubject = PublishSubject<void>();
  final AlgoRepository repository;
  final String address;
  final int asset;
  Timer timer;

  ValueStream<List> get stream => _subject.stream;

  Stream addStream(Stream<List> stream) {
    final s = stream
        .expand((element) => element)
        .distinctUnique()
        .asBroadcastStream();
    s.forEach((element) {
      _transactions.add(element);
    });
    return s;
  }

  _startPeriodicTimer() {
    timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      _addSubject.add(null);
    });
  }

  TransactionStreamProvider({this.address, this.asset, this.repository}) {
    final s = _addSubject.stream.asyncMap((event) {
      print('Updating for asset $asset');
      return repository.getLatestAssetTransactionsByIndex(
          address: address, limit: 5, asset: asset);
    });

    final output = addStream(s).map((event) => _transactions).distinct();

    _addSubject.add(null);

    _subject.addStream(output);

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