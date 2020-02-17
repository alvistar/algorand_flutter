import 'package:algorand_flutter/send_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_bloc.dart';
import 'app_state.dart';
import 'app_event.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppBloc appBloc = BlocProvider.of<AppBloc>(context);

    showSendSheet(BuildContext context) async {
      final result = await showModalBottomSheet(
          context: context,
          builder: (context) =>
              BlocProvider.value(value: appBloc, child: SendSheet()));

      // This is not the best as breaking logic of events to change state
      appBloc.add(SendSheetDismissed());
    }

    return Scaffold(
        appBar: AppBar(title: Text('Algorand')),
        body: BlocListener<AppBloc, AppState>(
          listener: (context, state) {
            if (state is SendSheetAppState) {
              showSendSheet(context);
            }
            if (state.runtimeType == InitialAppState) {
              Navigator.popUntil(context, (route) {
                if (route.isFirst)
                  return true;
                return false;
              });
            }
          },
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Center(
              child: Text((appBloc.state as InitialAppState).amount.toString()),
            ),
            RaisedButton(
              child: const Text('SEND'),
              onPressed: () {
                appBloc.add(SendSheetShow());
              },
            )
          ]),
        ));
  }
}
