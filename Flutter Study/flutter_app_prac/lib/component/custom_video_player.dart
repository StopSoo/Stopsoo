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

    return VideoPlayer(videoController!);
  }
}