import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_bloc.dart';
import 'app_state.dart';
import 'app_event.dart';

class SendSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppBloc appBloc = BlocProvider.of<AppBloc>(context);
    return Container(
//          height: 500,
          color: Colors.grey,
          child: Column (
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'TO'
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'AMOUNT'
                ),
              ),
              RaisedButton(
                child: Text('CANCEL'),
                onPressed: () {},
              )
            ]
          ),
        );
  }
}
