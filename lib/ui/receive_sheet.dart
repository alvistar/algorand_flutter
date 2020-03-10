import 'package:algorand_flutter/blocs/app_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ReceiveSheet extends StatelessWidget {
  ReceiveSheet();

  @override
  Widget build(BuildContext context) {
    final AppBloc appBloc = BlocProvider.of<AppBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        QrImage(
            data: 'algorand://${appBloc.state.base.account.address}',
            version: QrVersions.auto,
            size: 200)
      ],
    );
  }
}
