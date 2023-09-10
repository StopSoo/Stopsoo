import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final XFile video;  // 영상 받는 변수

  const CustomVideoPlayer({required this.video, super.key});

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  VideoPlayerController? videoController; // video player를 위해 필요
  
  @override
  void initState() {
    super.initState();

    // async로 선언할 수 없어 별개의 함수로 작성한다. 
    initializeController();
  }

  void initializeController() async {
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
    // 2. ! : 위에서 선언했으므로 null이 아니니까 !로 선언한다. 
    await videoController!.initialize();

    // setState() 함수가 실행되면 build를 새로 한다.
    setState(() {
      
    });
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
      child: Stack(
        children: [
          VideoPlayer(
            videoController!
          ),
          _Controls(
            onReversePressed: onReversePressed,
            onPlayPressed: onPlayPressed,
            onForwardPressed: onForwardPressed,
            isPlaying: videoController!.value.isPlaying,  // 현재 영상이 실행되는지 여부를 나타내는 값 (!)
          ),
          // Positioned : Stack() 내에서 위치를 더 쉽게 조정할 수 있는 방법
          Positioned(
            // 오른쪽 끝에서부터 0px만큼 이동
            right: 0,
            child: IconButton(
              onPressed: () {}, 
              color: Colors.white,
              iconSize: 30.0,
              icon: Icon(
                Icons.photo_camera_back
              )
            ),
          )
        ]
      )
    );
  }

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
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