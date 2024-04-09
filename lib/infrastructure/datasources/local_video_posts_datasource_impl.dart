
import 'package:toktik/domain/datasource/video_posts_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_posts.dart';

class LocalVideoDatasource implements VideoPostsDatasource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByPage(String userId) {
    // TODO: implement getFavoriteVideosByPage
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts.map(
      (video) => LocalVideoModel.fromJsonMap(video).toVideoPostEntity()
    ).toList();

    return newVideos;
  }

}