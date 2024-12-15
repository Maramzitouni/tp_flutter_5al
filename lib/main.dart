

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_flutter_5al/post_screen/post_screen.dart';
import 'package:tp_flutter_5al/post_screen/posts_bloc/posts_bloc.dart';
import 'package:tp_flutter_5al/shared/services/local_posts_data_source/fake_local_posts_data_source.dart';
import 'package:tp_flutter_5al/shared/services/posts_repository.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => PostsBloc(
            postsRepository: PostsRepository(
              localDataSource: FakeLocalPostsDataSource(),
            ),
          )..add(GetAllPosts()),
        ),
      ],
      child: const MaterialApp(
        home: PostsScreen(),
      ),
    );
  }
}