import 'package:algorand_flutter/blocs/app_bloc.dart';
import 'package:algorand_flutter/blocs/app_event.dart';
import 'package:algorand_flutter/blocs/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppBloc appBloc = BlocProvider.of<AppBloc>(context);
    final s = appBloc.state as AppSettings;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () { appBloc.add(AppBack());},
          ),
            title: Text('Settings')),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    title: Text(s.base.account.address),
                    subtitle: Text('Address'),
                    onTap: () => appBloc.add(AppSeedShow()),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Reset Account'),
                    onTap: () { appBloc.add(AppSeedReset());},
                  ),
                  Divider(),
                ],
              ),
            )
          ],
        ));
  }
}
