import 'package:dart_algorand/dart_algorand.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:manta_dart/messages.dart';

import '../app_bloc.dart';
import '../app_state.dart';
import '../app_event.dart';

class MantaSheet extends StatelessWidget {
  final Merchant merchant;
  final Destination destination;

  MantaSheet({this.merchant, this.destination});

  @override
  Widget build(BuildContext context) {
    final AppBloc appBloc = BlocProvider.of<AppBloc>(context);
    return BlocListener<AppBloc, AppState>(
        listener: (context, state) {},
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Text("Sending Manta", textScaleFactor: 2,),
              TextFormField(
                enabled: false,
                decoration: InputDecoration(labelText: 'TO'),
                initialValue: merchant.name,
              ),
              TextFormField(
                enabled: false,
                decoration: InputDecoration(labelText: 'AMOUNT'),
                initialValue: destination.amount.toString(),
              ),
              RaisedButton(
                child: Text('SEND'),
                onPressed: () {
//                  appBloc.add(Send(
//                      destination: _destination.text,
//                      amount: int.parse(_amount.text)));
                },
              )
            ]),
          ),
        ));
  }
}
