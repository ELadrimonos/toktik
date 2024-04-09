import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initialLoading = true;
  final VideoPostsRepository videosRepository;

  List<VideoPost> listVideoPosts = [];

  DiscoverProvider({required this.videosRepository});

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));

    // final List<VideoPost> newVideos =
    //     videoPosts.map((video) => LocalVideoModel.fromJsonMap(video).toVideoPostEntity()).toList();

    final newVideos = await videosRepository.getTrendingVideosByPage(1);

    listVideoPosts.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
