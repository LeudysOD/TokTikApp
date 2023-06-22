import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tiktok_app/presentation/provider/discover_provider.dart';

import '../../../widgets/shared/video_scrollable_view.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final discoverProvider = context.watch<DiscoverProvider>();
    
    return SafeArea(
      child: Scaffold(
        body: discoverProvider.initialLoading
        ? const Center(
          child: CircularProgressIndicator(strokeWidth: 2))
        :  VideoScrollableView(videos: discoverProvider.videosList,)
      
      ));
  }
}
