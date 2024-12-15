import '../../models/post.dart';
import 'dart:async';

class FakeLocalPostsDataSource {
  final List<Post> _fakePosts = [
    const Post(id: '1', title: 'Post 1', description: 'Description of Post 1'),
    const Post(id: '2', title: 'Post 2', description: 'Description of Post 2'),
    const Post(id: '3', title: 'Post 3', description: 'Description of Post 3'),
  ];

  Future<List<Post>> getAllPosts() async {
    await Future.delayed(const Duration(seconds: 1));
    return _fakePosts;
  }

  Future<Post> createPost(Post postToAdd) async {
    await Future.delayed(const Duration(seconds: 1));
    _fakePosts.add(postToAdd);
    return postToAdd;
  }

  Future<Post> updatePost(Post updatedPost) async {
    await Future.delayed(const Duration(seconds: 1));
    final index = _fakePosts.indexWhere((post) => post.id == updatedPost.id);
    if (index != -1) {
      _fakePosts[index] = updatedPost;
    }
    return updatedPost;
  }
}
