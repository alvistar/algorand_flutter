import 'package:algorand_flutter/blocs/app_bloc.dart';
import 'package:algorand_flutter/blocs/app_event.dart';
import 'package:algorand_flutter/blocs/app_state.dart';
import 'package:dart_algorand/dart_algorand.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendSheet extends StatefulWidget {
  final String destAddress;
  final int destAmount;

  SendSheet({key, this.destAmount, this.destAddress}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SendSheetUIState();
}

class SendSheetUIState extends State<SendSheet> {
  final _destination = TextEditingController();
  final _amount = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  FocusNode _amountFocusNode;

  @override
  void initState() {
    _destination.text = widget.destAddress;
    _amount.text =
        widget.destAmount != null ? widget.destAmount.toString() : "";

    _amountFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    _amountFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppBloc appBloc = BlocProvider.of<AppBloc>(context);
    return BlocListener<AppBloc, AppState>(
      listener: (context, state) {
        if (state is AppHomeSendSheet) {
          _amount.text = state.destAmount.toString();
          _destination.text = state.destAddress;
        }
      },
      child: SafeArea(
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Form(
            key: _formKey,
//          height: 500,
//          color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                TextFormField(
                    maxLines: null,
                    controller: _destination,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: 'TO'),
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_amountFocusNode),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter address';
                      }

                      if (!is_valid_address(value)) {
                        return 'This is not a valid address';
                      }
                      return null;
                    }),
                TextFormField(
                  controller: _amount,
                  focusNode: _amountFocusNode,
                  textInputAction: TextInputAction.done,
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(labelText: 'AMOUNT'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter amount';
                    }

                    if (int.parse(value) >
                        (appBloc.state as AppHomeSendSheet).balance) {
                      return 'Not enough balance';
                    }

                    return null;
                  },
                ),
                ButtonBar(alignment: MainAxisAlignment.spaceEvenly, children: [
                  RaisedButton(
                    child: Text('SCAN'),
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed: () async {
                      appBloc.add(AppQRScan());
                    },
                  ),
                  RaisedButton(
                    child: Text('SEND'),
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed: () {
                      if (!_formKey.currentState.validate()) {
                        return;
                      }

                      appBloc.add(AppSend(
                          destination: _destination.text,
                          amount: int.parse(_amount.text)));
                    },
                  )
                ]),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
