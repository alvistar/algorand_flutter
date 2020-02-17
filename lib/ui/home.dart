import 'package:algorand_flutter/ui/send_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manta_dart/messages.dart';

import '../app_bloc.dart';
import '../app_state.dart';
import '../app_event.dart';
import 'manta_sheet.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppBloc appBloc = BlocProvider.of<AppBloc>(context);

    showSendSheet({BuildContext context, int amount, String address}) async {
      final result = await showModalBottomSheet(
          context: context,
          builder: (context) => BlocProvider.value(
              value: appBloc,
              child: SendSheet(
                destAmount: amount,
                destAddress: address,
              )));

      // This is not the best as breaking logic of events to change state
      appBloc.add(SendSheetDismissed());
    }

    showMantaSheet(
        {BuildContext context,
        Merchant merchant,
        Destination destination}) async {
      final result = await showModalBottomSheet(
          context: context,
          builder: (context) => BlocProvider.value(
              value: appBloc,
              child: MantaSheet(
                destination: destination,
                merchant: merchant,
              )));

      // This is not the best as breaking logic of
      appBloc.add(MantaSheetDismissed());
    }

    return Scaffold(
        appBar: AppBar(title: Text('Algorand')),
        body: BlocListener<AppBloc, AppState>(
          // Do it only if we are moving forward
          condition: (previous, current) {
            if (previous.runtimeType == InitialAppState &&
                current.runtimeType == SendSheetAppState) {
              return true;
            }

            if (previous.runtimeType == SendSheetAppState &&
                current.runtimeType == MantaSheetAppState) {
              return true;
            }

            return false;
          },

          listener: (context, state) {
            if (state.runtimeType == SendSheetAppState) {
              showSendSheet(
                  context: context,
                  amount: (state as SendSheetAppState).destAmount,
                  address: (state as SendSheetAppState).destAddress);
            }

            if (state.runtimeType == MantaSheetAppState) {
              final s = state as MantaSheetAppState;
              showMantaSheet(
                  context: context,
                  merchant: s.merchant,
                  destination: s.destination);
            }
          },
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Center(
              child:
                  Text((appBloc.state as InitialAppState).balance.toString()),
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
