import 'package:algorand_flutter/blocs/app_bloc.dart';
import 'package:algorand_flutter/blocs/app_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountSetup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppBloc appBloc = BlocProvider.of<AppBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Account Setup')),
      body: Row(children: [
        Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              RaisedButton(
                child: Text('New Seed'),
                onPressed: () => appBloc.add(AppSeedGenerate()),
              ),
              RaisedButton(
                child: Text('Import Seed'),
                onPressed: () => appBloc.add(AppImportSeedShow()),
              )
            ]))
      ]),
    );
  }
}
