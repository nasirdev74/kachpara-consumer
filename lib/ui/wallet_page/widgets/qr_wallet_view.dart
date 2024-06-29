import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/ui/wallet_page/widgets/constant.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRWalletView extends StatefulWidget {
  final String walletAddress;
  const QRWalletView({
    super.key,
    required this.walletAddress,
  });

  @override
  State<QRWalletView> createState() => _QRWalletViewState();

  static void showBottomSheet({
    required BuildContext context,
    required String walletAddress,
  }) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Colors.black26,
      context: context,
      builder: (context) {
        return QRWalletView(
          walletAddress: walletAddress,
        );
      },
    );
  }
}

class _QRWalletViewState extends State<QRWalletView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 463,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.l10n.receive,
                  style: const TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 26.0,
                    letterSpacing: 0.44,
                    color: headingColor,
                  ),
                ),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.clear,
                      color: headingColor,
                    ))
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            QrImageView(
              data: widget.walletAddress,
              size: 200.0,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              context.l10n.send_only_USDC_to_this_address,
              textAlign: TextAlign.center,
              style: const TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.w400, fontSize: 11.0, letterSpacing: 0.44, color: placeholderColor),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Clipboard.setData(
                  ClipboardData(
                    text: widget.walletAddress,
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Copied to clipboard"),
                  ),
                );
                Navigator.pop(context);
              },
              child: Container(
                height: 30,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: bSheetbtnColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ImageIcon(
                      AssetImage("assets/images/copy.png"),
                      color: primaryColor,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      modifyWalletAddress(widget.walletAddress),
                      style:
                          const TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.w400, fontSize: 14.0, letterSpacing: 0.44, color: primaryColor),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ));
  }
}

// wallet address to "0x000000...00000000",
String modifyWalletAddress(String walletAddress) {
  if (walletAddress.length > 10) {
    return "${walletAddress.substring(0, 10)}...${walletAddress.substring(walletAddress.length - 10)}";
  }
  return walletAddress;
}
