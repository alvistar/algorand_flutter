import 'package:dart_algorand/dart_algorand.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../app_bloc.dart';
import '../app_state.dart';
import '../app_event.dart';

class SendSheet extends StatefulWidget {
  final String destAddress;
  final int destAmount;

  SendSheet({key, this.destAmount, this.destAddress}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SendSheetState();
}

class SendSheetState extends State<SendSheet> {
  final _destination = TextEditingController();
  final _amount = TextEditingController();

  @override
  void initState() {
    _destination.text = widget.destAddress;
    _amount.text =
        widget.destAmount != null ? widget.destAmount.toString() : "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppBloc appBloc = BlocProvider.of<AppBloc>(context);
    return BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          if (state is SendSheetAppState) {
            _amount.text = state.destAmount.toString();
            _destination.text = state.destAddress;
          }
        },
        child: Container(
//          height: 500,
//          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              TextField(
                maxLines: null,
                controller: _destination,
                decoration: InputDecoration(labelText: 'TO'),
              ),
              TextField(
                controller: _amount,
                keyboardType: TextInputType.number,
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                decoration: InputDecoration(labelText: 'AMOUNT'),
              ),
              RaisedButton(
                child: Text('SCAN'),
                onPressed: () async {
                  appBloc.add(ScanQR());
                },
              ),
              RaisedButton(
                child: Text('SEND'),
                onPressed: () {
                  appBloc.add(Send(
                      destination: _destination.text,
                      amount: int.parse(_amount.text)));
                },
              )
            ]),
          ),
        ));
  }
}
