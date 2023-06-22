import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tiktok_app/domain/entities/video_post.dart';
import 'package:tiktok_app/widgets/shared/video/fullscreen_player.dart';
import 'package:tiktok_app/widgets/shared/video_buttons.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;
  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.  builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount:  videos.length,
    itemBuilder: (context, index) {
      final VideoPost videoPost = videos[index];
      return Stack(
        children: [
          SizedBox.expand(
          child:FullScreenPlayer(videoUrl: videoPost.videoUrl, caption: videoPost.caption,) ,
          ),
         /*  FullScreenPlayer(video:videoPost) */

          Positioned(
            bottom: 20,
            right: 20,
            child: VideoButtons(video: videoPost))
        ],
      );

    },
    );
  }
}