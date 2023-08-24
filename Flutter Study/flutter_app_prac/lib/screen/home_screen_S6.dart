// Section 6 (WebView)
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreenS6 extends StatelessWidget {
  const HomeScreenS6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: 'https://blog.codefactory.ai',
      ),
    );
  }
}
