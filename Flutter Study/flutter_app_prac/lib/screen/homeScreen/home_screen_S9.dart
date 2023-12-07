// Section 9 : WebView
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

final homeUrl = Uri.parse('https://blog.codefactory.ai');

class HomeScreenS6 extends StatelessWidget {
  // WebView 3.0.4 : null이 가능하게 하기 위해 ? 사용해서 선언 + final이 아니므로 아래 const 제거
  // WebView 4.0.2 : controller를 위에서 직접 선언 후 아래에서 사용
  //                 3.0.4 버전에서는 아래에서 controller 사용 시 선언했던 것들을 위에서 controller 선언 시 모두 선언 (!)
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(homeUrl);
  // WebView 4.0.2 : url을 uri 형태로 선언해줘야 함 (!)
  // WebView 3.0.4 : url을 string 변수로 선언 후 사용 가능
  // final homeUrl = 'https://blog.codefactory.ai';

  HomeScreenS6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Code Factory'),
        centerTitle: true, // Android : false가 기본, ios: true가 기본
        actions: [
          IconButton(
            onPressed: () {
              // WebView 3.0.4 : callback을 통한 호출 -> null의 가능성 때문에 if문 사용
              //                 controller는 절대 null이 아니다는 의미로 !를 사용
              // if (controller == null) {
              //   return;
              // }
              // controller!.loadUrl(homeUrl);
              
              controller.loadRequest(homeUrl);
            },
            icon: Icon(Icons.home),
          )
        ],
      ),
      body: WebViewWidget(
        controller: controller,
      )
      // WebView 3.0.4 : WebView에 모든 것을 선언
      // WebView(
      //   // WebView가 생성되면 외부에서 받아온 controller를 class의 controller에 넣어준다.
      //   onWebViewCreated: (WebViewController controller) {
      //     this.controller = controller;
      //   },
      //   initialUrl: homeUrl,
      //   javascriptMode: JavascriptMode.unrestricted, // 항상 JS 실행
      // ),
    );
  }
}
