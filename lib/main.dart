import 'dart:async';

import 'package:algorand_flutter/ui/account_setup.dart';
import 'package:algorand_flutter/ui/import_seed.dart';
import 'package:algorand_flutter/ui/settings.dart';
import 'package:algorand_flutter/ui/show_seed.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logging/logging.dart';

import 'blocs/app_bloc.dart';
import 'blocs/app_state.dart';
import 'configuration.dart';
import 'ui/home.dart';

final Logger logger = Logger('AlgoWallet');

Configuration configuration = Configuration();

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    logger.fine(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logger.info("Transation ${transition.currentState.runtimeType} ->"
        "${transition.nextState.runtimeType} ** event: ${transition.event}");
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    logger.severe(error);
    logger.severe(stacktrace);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DotEnv().load('assets/.env');
  print(DotEnv().env['ALGO_NODE']);

  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.loggerName} ${rec.level.name}: ${rec.time}: ${rec.message}');
  });

  BlocSupervisor.delegate = SimpleBlocDelegate();

  await configuration.init();

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
      home: BlocProvider(
          create: (_) => AppBloc(configuration: configuration),
          child: AppPage()),
    );
  }
}

class AppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBloc = BlocProvider.of<AppBloc>(context);

    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      if (state is AppHome) {
        return HomePage();
      }
      if (state is AppSeed) {
        return ShowSeed();
      }
      if (state is AppImportSeed) {
        return ImportSeed();
      }
      ;
      if (state is AppSettings) {
        return Settings();
      }
      ;

      if (state is AppAccountSetup) {
        return AccountSetup();
      }
      throw UnimplementedError();
    });
  }
}
