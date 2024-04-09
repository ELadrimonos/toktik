import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/infrastructure/datasources/local_video_posts_datasource_impl.dart';
import 'package:toktik/infrastructure/repositories/video_posts_repository_implementation.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';

import 'config/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final videoPostRepository = VideoPostsRepositoryImpl(videoPostsDatasource: LocalVideoDatasource());


    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false, // Así se carga al iniciarlo
          create: (context) => DiscoverProvider(videosRepository: videoPostRepository)..loadNextPage()
        ),
      ],
      child: MaterialApp(
        title: 'TokTik',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
