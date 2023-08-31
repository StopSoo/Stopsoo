// Section 8 : 전자 액자 
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreenS8 extends StatefulWidget {
  const HomeScreenS8({super.key});

  @override
  State<HomeScreenS8> createState() => _HomeScreenS8State();
}

class _HomeScreenS8State extends State<HomeScreenS8> {
  Timer? timer; // timer 선언
  // 컨트롤러 선언 : PageView는 직접 만들어줘야 함
  PageController controller = PageController(
    initialPage: 0
  );

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      // controller 조정을 Timer 내부에 하기
      // controller.page는 원래 double 형태이나, toInt() 함수를 통해 int로 형 변환
      int currentPage = controller.page!.toInt();
      int nextPage = currentPage + 1;

      // 마지막 페이지일 때는 다시 첫 페이지로 이동시킴
      if (nextPage > 4) {
        nextPage = 0;
      }

      controller.animateToPage(
        nextPage, 
        duration: Duration(milliseconds: 400), 
        // linear : 처음부터 끝까지 같은 속도로 진행됨
        curve: Curves.linear
      );
    });
  }

  @override
  void dispose() {
    // for 메모리 낭비 방지
    // 모든 controller들을 이와 같이 할 것 (!)
    controller.dispose();

    if (timer != null) {
      // for 메모리 낭비 방지
      // ! : timer가 확실히 null이 아님을 표현 
      timer!.cancel();
    }

    // 위 과정들은 super.dispose()보다 상단에 작성할 것 (!)
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 상태바를 검정색으로 변경
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    
    return Scaffold(
      // PageView : 스크롤 가능
      body: PageView(
        controller: controller,

        // for more efficient code
        // map은 iterable을 반환하므로 toList()를 통해 List로 변환해줘야 한다 (!)
        children: [1, 2, 3, 4, 5]
            .map((e) => Image.asset('asset/img/image_$e.jpeg', fit: BoxFit.cover))
            .toList(),
        // [
        //   // Image.asset(
        //   //   'asset/img/image_1.jpeg',
        //   //   fit: BoxFit.cover
        //   // ),
        //   // Image.asset(
        //   //   'asset/img/image_2.jpeg',
        //   //   fit: BoxFit.cover
        //   // ),
        //   // Image.asset(
        //   //   'asset/img/image_3.jpeg',
        //   //   fit: BoxFit.cover
        //   // ),
        //   // Image.asset(
        //   //   'asset/img/image_4.jpeg',
        //   //   fit: BoxFit.cover
        //   // ),
        //   // Image.asset(
        //   //   'asset/img/image_5.jpeg',
        //   //   fit: BoxFit.cover
        //   // ),
        // ],
      )
    );
  }
}
