import '../models/post.dart';
import 'local_posts_data_source/fake_local_posts_data_source.dart';

class PostsRepository {
  final FakeLocalPostsDataSource localDataSource;

  PostsRepository({required this.localDataSource});

  Future<List<Post>> getAllPosts() async {
    return localDataSource.getAllPosts();
  }

  Future<Post> createPost(Post postToAdd) async {
    return localDataSource.createPost(postToAdd);
  }

  Future<Post> updatePost(Post updatedPost) async {
    return localDataSource.updatePost(updatedPost);
  }
}
