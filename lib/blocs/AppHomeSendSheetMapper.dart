import 'package:algorand_flutter/blocs/app_state.dart';
import 'package:dart_algorand/dart_algorand.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:manta_dart/manta_wallet.dart';

import 'app_event.dart';
import 'mapper.dart';

class AppHomeSendSheetMapper with Mapper{

  Stream<AppState> mapAppHomeSendSheetToState(
      AppEvent event, AppHomeSendSheet state) async* {
    if (event is AppSendSheetDismissed) {
      yield state.toInitialState();
    } else if (event is AppQRScan) {
      yield* _mapScanQRtoState(event, state);
    } else if (event is AppSend) {
      yield* mapGlobalEventToState(event);
      // Let be handled by main mapEventToState
    } else {
      throw UnimplementedError('$event not handled in $state');
    }
  }

  Stream<AppState> _mapScanQRtoState(
      AppQRScan event, AppHomeSendSheet state) async* {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", true, ScanMode.QR);

    // Test Manta Url
    final mantaParsed = MantaWallet.parseUrl(barcodeScanRes);

    if (mantaParsed != null) {
      print("Manta Address!");
      appBloc.mantaWallet = MantaWallet(barcodeScanRes);
      final envelope =
          await appBloc.mantaWallet.getPaymentRequest(cryptoCurrency: "ALGO-TESTNET");
      final pr = envelope.unpack();

      yield state.toMantaSheet(
          merchant: pr.merchant, destination: pr.destinations[0]);
    }

    final parsed = parseUrl(barcodeScanRes);

    if (parsed != null) {
      yield state.toSendSheet(
          destAddress: parsed.address, destAmount: parsed.amount);
    }
  }
}
