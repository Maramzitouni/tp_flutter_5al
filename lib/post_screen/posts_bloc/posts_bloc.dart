import 'package:bloc/bloc.dart';
import '../../shared/app_exception.dart';
import '../../shared/services/posts_repository.dart';
import '../../shared/models/post.dart';
import 'package:flutter/material.dart';

part 'posts_event.dart';

part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsRepository postsRepository;

  PostsBloc({required this.postsRepository}) : super(const PostsState()) {
    on<GetAllPosts>((event, emit) async {
      emit(state.copyWith(status: PostsStatus.loading));
      try {
        final posts = await postsRepository.getAllPosts();
        emit(state.copyWith(status: PostsStatus.success, posts: posts));
      } catch (error) {
        emit(state.copyWith(
            status: PostsStatus.error,
            errorMessage: AppException.from(error).toString()));
      }
    });

    on<CreatePost>((event, emit) async {
      try {
        emit(state.copyWith(status: PostsStatus.loading));
        final newPost = await postsRepository.createPost(event.post);
        final updatedPosts = List<Post>.from(state.posts)..add(newPost);
        emit(state.copyWith(status: PostsStatus.success, posts: updatedPosts));
      } catch (error) {
        emit(state.copyWith(
            status: PostsStatus.error,
            errorMessage: AppException.from(error).toString()));
      }
    });

    on<UpdatePost>((event, emit) async {
      try {
        emit(state.copyWith(status: PostsStatus.loading));
        final updatedPost = await postsRepository.updatePost(event.post);
        final updatedPosts = state.posts
            .map((post) => post.id == updatedPost.id ? updatedPost : post)
            .toList();
        emit(state.copyWith(status: PostsStatus.success, posts: updatedPosts));
      } catch (error) {
        emit(state.copyWith(
            status: PostsStatus.error,
            errorMessage: AppException.from(error).toString()));
      }
    });
  }
}
