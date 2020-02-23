import 'package:algorand_flutter/blocs/app_bloc.dart';
import 'package:algorand_flutter/blocs/app_event.dart';
import 'package:algorand_flutter/blocs/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowSeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppBloc appBloc = BlocProvider.of<AppBloc>(context);
    final s = appBloc.state as ShowSeedState;

    return Scaffold(
        appBar: AppBar(title: Text('Account Seed')),
        body: Column(
          children: <Widget>[
            TextFormField(
              enabled: false,
              maxLines: null,
              initialValue: s.address,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextFormField(
                enabled: false,
                maxLines: null,
                initialValue: s.privateKey,
                decoration: InputDecoration(labelText: 'Private Key')),
            RaisedButton(
              child: Text('OKAY'),
              onPressed: () => appBloc.add(Forward()),
            )
          ],
        ));
  }
}
