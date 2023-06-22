import 'package:flutter/material.dart';
import 'package:tiktok_app/domain/entities/video_post.dart';
import 'package:tiktok_app/infrastructure/models/local_video_model.dart';
import 'package:tiktok_app/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier{
  bool initialLoading = true;
  List<VideoPost> videosList = [];


  Future<void> loadNextPage() async{
    await Future.delayed(const Duration( seconds: 2));

    final List<VideoPost> newVideos = videoPosts.map((video) => 
    LocalVideoModel.fromJsonMap(video).toVideoPostEntity()
    ).toList();


   videosList.addAll(newVideos);
   initialLoading = false; 

    notifyListeners();  
  }
}