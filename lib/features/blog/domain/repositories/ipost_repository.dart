import 'package:blog_teste_tecnico/features/blog/domain/entities/post.dart';
import 'package:http/http.dart' as http;

abstract class IPostRepository {
  Future<List<Post>> findAllPosts();

  Future<List<Post>> findAllPostsByUser(int idUser);

  Future<Post> findPostById(int id);

  Future<Post> savePost(Post post);

  Future<Post> updatePost(int id, Post post);

  Future<http.Response> deletePost(int id);

}