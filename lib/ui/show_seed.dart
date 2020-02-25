import 'package:algorand_flutter/blocs/app_bloc.dart';
import 'package:algorand_flutter/blocs/app_event.dart';
import 'package:algorand_flutter/blocs/app_state.dart';
import 'package:dart_algorand/dart_algorand.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowSeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppBloc appBloc = BlocProvider.of<AppBloc>(context);
    final s = appBloc.state as AppSeed;

    return Scaffold(
        appBar: AppBar(
            title: Text('Account Seed'),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  appBloc.add(AppBack());
                })),
        body: Column(
          children: <Widget>[
            Expanded(
                child: ListView(children: <Widget>[
              ListTile(
                title: Text(s.base.account.address),
                subtitle: Text('Address'),
                onTap: () => appBloc.add(AppSeedShow()),
              ),
              ListTile(
                title: Text(s.base.account.private_key),
                subtitle: Text('Private Key'),
              ),
                  ListTile(
                    subtitle: Text('Seed'),
                    title: Text(from_private_key(s.base.account.private_key))
                  )
            ])),
            !s.forwardable
                ? SizedBox.shrink()
                : RaisedButton(
                    child: Text('OKAY'),
                    onPressed: () => appBloc.add(AppForward()),
                  )
          ],
        ));
  }
}
