import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;
  
  const FullScreenPlayer({super.key, required this.videoUrl, required this.caption});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  @override
  void initState() {
    super.initState();
    videoController = VideoPlayerController.asset(widget.videoUrl)
    ..setVolume(0)
    ..setLooping(true)
    ..play();
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  late VideoPlayerController videoController;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: videoController.initialize(), 
      builder: (context, snapshot) {
        if(snapshot.connectionState != ConnectionState.done){
           return const Center(
          child: CircularProgressIndicator(strokeWidth: 2,),
        );
        }
        return VideoPlayer(videoController);
       
      },
    );
  }
}