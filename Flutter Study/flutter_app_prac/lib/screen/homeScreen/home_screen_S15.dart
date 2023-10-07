// Section 15 : 동영상 플레이어
// 동영상 재생 시 화면이 push되는 형태가 아닌, 이 파일 내에서 영상이 재생되도록 설정 (!)
import 'package:flutter/material.dart';
import 'package:flutter_application_prac/component/custom_video_player.dart';
import 'package:image_picker/image_picker.dart';

// stateful widget으로 변경 => class 내 모든 위젯들에서 context 사용 가능 (!)
class HomeScreenS15 extends StatefulWidget {
  const HomeScreenS15({super.key});

  @override
  State<HomeScreenS15> createState() => _HomeScreenS15State();
}

class _HomeScreenS15State extends State<HomeScreenS15> {
  XFile? video; // for image picker

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: video == null ? renderEmpty() : renderVideo(),
    );
  }

  Widget renderVideo() {
    return Center(
      child: CustomVideoPlayer(
        video: video!,
        onNewVideoPressed: onNewVideoPressed,
      )
    );
  }
  
  Widget renderEmpty() {
    return Container(
      width: MediaQuery.of(context).size.width,
      // Container 자체에 color를 지정 or BoxDecoration 안에 color를 지정
      decoration: getBoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _logo(
            onTap: onNewVideoPressed,
          ),
          SizedBox(height: 30.0),
          _AppName()
        ],
      ),
    );
  }

  // async-await 설정
  // : 이미지 클릭 시 갤러리로 전환되어 사용자가 미디어를 선택할 때까지 기다려야 하기 때문
  void onNewVideoPressed() async {
    final video = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );

    // null check
    if (video != null) {
      setState(() {
        // 고른 비디오를 이 함수의 변수 video에 넣는다. 
        this.video = video; 
      });
    }
  }

  BoxDecoration getBoxDecoration() {
    return BoxDecoration(
      // LinearGradient : 한 색깔이 위에서부터 찬찬히 바뀐다는 뜻
      // RadialGradient : 한 색깔이 가운데서부터 동그랗게 바깥쪽으로 바뀌어 간다는 뜻
      gradient: LinearGradient(
        // begin, end, colors 세 가지 요소를 설정
        // colors : list를 받음
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          // 위쪽 색깔부터 차례로 넣기
          Color(0xFF2A3A7C),
          Color(0xFF000118),
        ]
      )
    );
  }
}

class _logo extends StatelessWidget {
  // VoidCallback형 onTap 함수를 named parameter로 선언해줌으로써 상위에서 onTap을 사용할 수 있다.
  final VoidCallback onTap;
  
  const _logo({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // GestureDetector 위젯의 child 위젯을 누르면 onTap 함수가 실행됨
      onTap: onTap,
      child: Image.asset(
        'asset/img/logo.png'
      ),
    );
  }
}

class _AppName extends StatelessWidget {
  const _AppName({super.key});

  @override
  Widget build(BuildContext context) {
    // text style 설정 => build 안에 넣을 것 !
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 30.0,
      fontWeight: FontWeight.w300,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'VIDEO',
          style: textStyle
        ),
        Text(
          'PLAYER',
          // .copyWith() : 적용된 설정은 유지하고, 추가로 다른 설정을 적용할 수 있음
          style: textStyle.copyWith(
            fontWeight: FontWeight.w700
          )
        )
      ],
    );
  }
}