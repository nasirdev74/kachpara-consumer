import 'package:flutter/material.dart';
import 'package:kachpara/ui/wallet_page/widgets/indicator_loading.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  static const String routeName = 'web_page';
  final String url;
  final String title;
  const WebPage({
    super.key,
    required this.url,
    required this.title,
  });

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  late final WebViewController controller;
  bool isLoading = true;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (String url) {
          setState(() {
            isLoading = false;
          });
        },
      ))
      ..loadRequest(Uri.parse(widget.url));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: isLoading ? const IndicatorLoading() : WebViewWidget(controller: controller),
    );
  }
}
