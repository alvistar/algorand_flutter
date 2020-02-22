import 'package:algorand_flutter/blocs/app_bloc.dart';
import 'package:algorand_flutter/blocs/app_event.dart';
import 'package:algorand_flutter/blocs/app_state.dart';
import 'package:algorand_flutter/ui/send_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manta_dart/messages.dart';
import 'package:algo_explorer_api/algo_explorer_api.dart';

import 'manta_sheet.dart';

class HomePage extends StatelessWidget {
  static GlobalKey sendKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final AppBloc appBloc = BlocProvider.of<AppBloc>(context);

    showSendSheet({BuildContext context, int amount, String address}) async {
      print (sendKey.currentWidget);
      if (sendKey.currentWidget != null) {
        return;
      };

      final result = await showModalBottomSheet(
          context: context,
          builder: (context) => BlocProvider.value(
              value: appBloc,
              child: SendSheet(
                key: sendKey,
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
          condition: (previous, current) {
            // Conditions to avoid opening two SendSheet

//            if (current is HomeSendSheetState &&
//                previous is HomeSendSheetState) {
//              return false;
//            }

//            if (current is HomeSendSheetState &&
//                previous is  HomeMantaSheetState) {
//              return false;
//            }

            return true;
          },
          listener: (context, state) {
            if (state is HomeInitialState) {
              // Ensure we are on InitialAppState
              Navigator.popUntil(context, (route) => route.isFirst);
            }

            if (state is HomeSendSheetState) {
              showSendSheet(
                  context: context,
                  amount: state.destAmount,
                  address: state.destAddress);
            }

            if (state is  HomeMantaSheetState) {
              showMantaSheet(
                  context: context,
                  merchant: state.merchant,
                  destination: state.destination);
            }
          },
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text((appBloc.state as HomeState).balance.toString()),
                  assetDropdown(
                      current: (appBloc.state as HomeState).currentAsset,
                      assets: (appBloc.state as HomeState).assets,
                      onChanged: (value) {
                        appBloc.add(ChangeAsset(value));
                      })
                ]),
            ),
            Expanded(
                child: transactionList(
                    (appBloc.state as HomeState).transactions)),
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

assetDropdown({
  String current,
  List<String> assets,
  void Function(String value) onChanged}) {

  return DropdownButton<String>(
      hint: Text('Select currency'),
      value: current,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      items: assets.map((e) =>
          DropdownMenuItem (
            value: e,
            child: Text(e),
      )).toList(),
      onChanged: onChanged);
}

transactionList(List transactions) {
  final pts = transactions.whereType<TransactionPay>();
  final listIter = pts.map((entry) => ListTile(
        title: Text(entry.to),
        subtitle: Text(entry.amount.toString()),
      ));

  return ListView(
    children: listIter.toList(),
  );
}
