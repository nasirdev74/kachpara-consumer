import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';

class QrCodeScanningPage extends StatefulWidget {
  static const String routeName = 'qr_code_scanning_page';
  const QrCodeScanningPage({
    super.key,
  });

  @override
  State<QrCodeScanningPage> createState() => _QrCodeScanningPageState();
}

class _QrCodeScanningPageState extends State<QrCodeScanningPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.qr_scan,
        ),
      ),
      body: QRCodeDartScanView(
        scanInvertedQRCode: true,
        typeScan: TypeScan.live,
        onCapture: (Result result) {
          context.pop(result.text);
        },
      ),
    );
  }
}
