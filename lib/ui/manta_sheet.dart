import 'dart:math';

import 'package:algorand_flutter/blocs/app_bloc.dart';
import 'package:algorand_flutter/blocs/app_event.dart';
import 'package:algorand_flutter/blocs/app_state.dart';
import 'package:dart_algorand/dart_algorand.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:manta_dart/messages.dart';
import 'package:decimal/decimal.dart';


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
                maxLines: null,
                decoration: InputDecoration(labelText: 'ADDRESS'),
                initialValue: destination.destination_address,
              ),
              TextFormField(
                enabled: false,
                decoration: InputDecoration(labelText: 'AMOUNT'),
                initialValue: destination.amount.toString(),
              ),
              RaisedButton(
                child: Text('SEND'),
                onPressed: () {
                  final amt = (destination.amount * Decimal.fromInt(pow(10,6))).toInt();
                  print(amt);
                  appBloc.add(AppSend(
                      destination: destination.destination_address,
                      amount: amt));
                },
              )
            ]),
          ),
        ));
  }
}
