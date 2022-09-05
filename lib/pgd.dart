import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewApp extends StatefulWidget {
  final String ip;
  const WebViewApp({Key? key,required this.ip}) : super(key: key);

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('PGD Panel '),
      ),
      body:  WebView(
        initialUrl: 'http://' + widget.ip + '/pgd_legacy/index_cweb.htm',
        javascriptMode:JavascriptMode.unrestricted ,
      ),
    );
  }
}