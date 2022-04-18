import 'package:blog_teste_tecnico/domain/entities/post.dart';

abstract class IPostRepository {
  Future<List<dynamic>> findAllPosts();

  Future<dynamic> findAllPostsByUser(int idUser);

  Future<dynamic> findPostById(int id);

  Future<dynamic> savePost(Post post);

  Future<dynamic> updatePost(int id, Post post);

  Future<dynamic> deletePost(int id);

}