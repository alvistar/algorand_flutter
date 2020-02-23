import 'dart:async';

import 'package:algorand_flutter/ui/new_seed.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

import 'blocs/app_bloc.dart';
import 'blocs/app_state.dart';
import 'ui/home.dart';

final Logger logger = Logger('AlgoWallet');

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    logger.fine(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logger.info(
        "Transation ${transition.currentState.runtimeType} ->"
        "${transition.nextState.runtimeType} ** event: ${transition.event}");
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    logger.severe(error);
  }
}

void main() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.loggerName} ${rec.level.name}: ${rec.time}: ${rec.message}');
  });

  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Algorand Wallet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(create: (_) => AppBloc(), child: AppPage()),
    );
  }
}

class AppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (state is HomeState) {
            return HomePage();
          }
          if (state is NewSeedState) {
            return NewSeed();
          }
          throw UnimplementedError();
    });
  }
}
