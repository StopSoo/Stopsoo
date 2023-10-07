import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final XFile video;  // 영상 받는 변수
  final VoidCallback onNewVideoPressed; // 새로운 비디오를 선택하는 버튼

  const CustomVideoPlayer({
    required this.video, 
    required this.onNewVideoPressed,
    super.key
  });

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  VideoPlayerController? videoController; // video player를 위해 필요
  Duration currentPosition = Duration();  // 비디오 플레이어의 현재 위치 (0부터 시작)
  bool showControls = false;   // 비디오 컨트롤러 보이기 여부

  // initState() 함수는 처음에 build될 때 한 번만 불린다.
  // 고로, 새로운 비디오를 선택해서 불러올 때 비디오가 로딩이 되지 않는 문제가 발생
  // 따라서 새로운 비디오 선택해서 불러올 때는 didUpdateWidget을 실행시켜야 한다. 
  @override
  void initState() {
    super.initState();

    // async로 선언할 수 없어 별개의 함수로 작성한다. 
    initializeController();
  }

  // for new video choice
  @override
  void didUpdateWidget(covariant CustomVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);

    // oldWidget은 새로운 비디오가 생성되기 전 위젯
    // widget은 새로운 비디오를 선택할 위젯 
    if (oldWidget.video.path != widget.video.path) {
      // 새로운 비디오가 선택되었을 경우 initializeController를 다시 실행한다.
      initializeController();
    }
  }

  void initializeController() async {
    // initializecontroller가 실행될 때마다 현재 위치를 영상의 시작 위치로 초기화
    currentPosition = Duration();

    videoController = VideoPlayerController.file(
      // 1. VideoPlayerController.file()에는 File 형이 들어가야 한다.
      // 2. File형에는 'dart:io'에서 불러올 수 있는 File과 'dart:html'에서 불러올 수 있는 File이 있다. 
      //    여기서는 'dart:io'에서 불러올 수 있는 File을 사용해야 한다. 
      // 3. 애초에 video를 받아올 때 image picker에서 사용하는 XFile 자료형이므로 File형으로 바꿔줘야 한다. 
      //    바꾸는 방법은 아래와 같다.
      File(widget.video.path)
    );

    // 1. initState() 함수는 async 함수로 선언할 수 없다.
    //    따라서 controller를 선언하는 함수를 따로 선언한다.
    // 2. ! : 위에서 null check를 했으므로 컨트롤러는 무조건 null이 아니니까 !로 선언한다. 
    await videoController!.initialize();

    // for Slider
    // 슬라이더를 통해 이동한 위치로 동영상이 위치할 수 있도록 함
    // 비디오 컨트롤러의 값이 변경될 때마다 리스너가 실행된다. 
    videoController!.addListener(() async {
      final currentPosition = videoController!.value.position;  // 현재 위치

      setState(() {
        this.currentPosition = currentPosition;
      });
    });

    // setState() 함수가 실행되면 build를 새로 한다.
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // null check
    // 애초에 videoController가 생성되면 null인데, 
    // 함수 initializeController()에서 값을 받아 오기 전에 return해야 할 수도 있으므로 (!)
    if(videoController == null) {
      return CircularProgressIndicator();
    }
    
    return AspectRatio(
      // 비디오를 원래 비율대로 보일 수 있게 해준다
      aspectRatio: videoController!.value.aspectRatio,
      child: GestureDetector(
        // 비디오 컨트롤 세트 뷰 여부 조정
        onTap: () {
          setState(() {
            showControls = !showControls;
          });
        },
        child: Stack(
          children: [
            VideoPlayer(
              videoController!
            ),
            // 한 번 터치해서 showControls가 true가 되면 
            if (showControls) 
              _Controls(
                onReversePressed: onReversePressed,
                onPlayPressed: onPlayPressed,
                onForwardPressed: onForwardPressed,
                isPlaying: videoController!.value.isPlaying,  // 현재 영상이 실행되는지 여부를 나타내는 값 (!)
              ),
            // 한 번 터치해서 showControls가 true가 되면 
            if (showControls)
              _NewVideo(
                // 새로운 비디오를 선택하는 화면으로 넘어가야 하므로 이 파일에서 관리X (!)
                // home_screen_S15.dart 파일의 onNewVideoPressed() 함수와 연결
                // 외부에서 넘어오는 함수를 받기 위해 widget. 키워드를 사용
                onPressed: widget.onNewVideoPressed,
              ),
            _SliderBottom(
              currentPosition: currentPosition, 
              maxPosition: videoController!.value.duration, 
              onSliderChanged: onSliderChanged
            )
          ]
        ),
      )
    );
  }

  // 슬라이더가 바뀔 때마다 적용하는 함수
  void onSliderChanged(double val) {
    videoController!.seekTo(
      Duration(
        seconds: val.toInt(),
      )
    );
  }

  // 뒤로 가기 버튼 함수
  void onReversePressed() {
    // 비디오 플레이어의 현재 위치
    final currentPosition = videoController!.value.position;
    
    // 3초 전으로 위치 조정
    Duration position = Duration(); // 기본 위치는 0초로 설정
    if (currentPosition.inSeconds > 3) {  // 3초를 넘었을 때만 3초 전으로 이동할 수 있게
      position = currentPosition - Duration(seconds: 3);
    }

    // position 위치로 이동
    videoController!.seekTo(position);
  }

  // 재생 버튼 함수
  void onPlayPressed() {
    // 이미 실행 중이면 중지, 실행 중이 아니면 실행
    setState(() {
      // 위에서 videoController에 대해 null check를 했으므로 ! 가능 
      if (videoController!.value.isPlaying) { // 재생 중이면
        videoController!.pause();
      } else {  // 재생 중이 아니면
        videoController!.play();
      }
    });
  }

  // 앞으로 가기 버튼 함수
  void onForwardPressed() {
    // 비디오 플레이어의 현재 위치
    final currentPosition = videoController!.value.position;
    // 영상의 전체 길이
    final maxPosition = videoController!.value.duration;
    
    // 3초 후로 위치 조정
    Duration position = maxPosition;
    if ((maxPosition - Duration(seconds: 3)).inSeconds > currentPosition.inSeconds) {  
      position = currentPosition + Duration(seconds: 3);
    }

    // position 위치로 이동
    videoController!.seekTo(position);
  }
}

// 비디오 컨트롤 버튼
class _Controls extends StatelessWidget {
  // 상위 state 위젯으로 올리기 위해 설정
  final VoidCallback onPlayPressed;
  final VoidCallback onReversePressed;
  final VoidCallback onForwardPressed;
  final bool isPlaying;

  const _Controls({
    required this.onPlayPressed, 
    required this.onForwardPressed,
    required this.onReversePressed,
    required this.isPlaying,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // 컨트롤 버튼들이 더 잘 보이게 하기 위해 투명도 조절
      color: Colors.black.withOpacity(0.5),
      // crossAxisAlignment 대신 아래와 같이 설정 (!)
      height: MediaQuery.of(context).size.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // 아래처럼 crossAxisAlignment를 설정해놓을 경우, 버튼 위 영역을 눌러도 버튼이 눌리기 때문에 설정 해제 (!)
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          renderIconButton(
            onPressed: onReversePressed,
            iconData: Icons.rotate_left,
          ),
          renderIconButton(
            onPressed: onPlayPressed,
            iconData: isPlaying? Icons.pause : Icons.play_arrow,
          ),
          renderIconButton(
            onPressed: onForwardPressed,
            iconData: Icons.rotate_right,
          )
        ],
      ),
    );
  }

  // 비디오 위에 아이콘 버튼들 위젯
  Widget renderIconButton({
    // 바꿀 수 있는 부분들만 named parameter로 넣어준다. 
    required VoidCallback onPressed,
    required IconData iconData,
  }) {
    return IconButton(
      onPressed: onPressed,
      iconSize: 30.0,
      color: Colors.white, 
      icon: Icon(
        iconData,
      )
    );
  }
}

// 새로운 비디오 선택 버튼
class _NewVideo extends StatelessWidget {
  final VoidCallback onPressed;
  const _NewVideo({
    required this.onPressed,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    // Positioned : Stack() 내에서 위치를 더 쉽게 조정할 수 있는 방법
    return Positioned(
      // 오른쪽 끝에서부터 0px만큼 이동
      right: 0,
      child: IconButton(
        onPressed: onPressed, 
        color: Colors.white,
        iconSize: 30.0,
        icon: Icon(
          Icons.photo_camera_back
        )
      ),
    );
  }
}

class _SliderBottom extends StatelessWidget {
  final Duration currentPosition;
  final Duration maxPosition;
  final ValueChanged<double> onSliderChanged; // slider에 들어가는 함수

  const _SliderBottom({
    required this.currentPosition,
    required this.maxPosition,
    required this.onSliderChanged,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      // 오른쪽, 왼쪽 다 0으로 줌으로써 slider가 양쪽으로 stretch되게 함
      right: 0,
      left: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Text(
              // 체크해야 할 부분
              // 1. 현재 위치를 초로 변환(60초까지만 나와야 함)
              // 2. 문자로 변환 후 두 자리로 나올 수 있게 설정 -> padLeft(자릿수, 빈 자릿수를 채울 문자)
              '${currentPosition.inMinutes}:${(currentPosition.inSeconds % 60).toString().padLeft(2, '0')}',
              style: TextStyle(
                color: Colors.white,
              )
            ),
            Expanded(
              child: Slider(
                // 초 단위로 변환 및 inSeconds()는 int를 반환하므로 double 값으로 변환
                max: maxPosition.inSeconds.toDouble(),
                min: 0,
                // currentPosition은 Duration형이니까 초 단위로 바꾸고 double 값으로 변환
                value: currentPosition.inSeconds.toDouble(),
                // onChanged에 함수 들어가는 것 체크 (!)
                // setState() 함수가 아닌 비디오컨트롤러의 seekTo() 함수를 사용해야 한다.
                // 슬라이더에서 위치를 조정할 때마다 그 위치로 이동하라는 명령을 해야 하기 때문
                onChanged: onSliderChanged,
              ),
            ),
            Text(
              // 현재 위치 대신 비디오 전체 길이를 넣어준다.
              '${maxPosition.inMinutes}:${(maxPosition.inSeconds % 60).toString().padLeft(2, '0')}',
              style: TextStyle(
                color: Colors.white,
              )
            ),
          ],
        ),
      ),
    );
  }
}