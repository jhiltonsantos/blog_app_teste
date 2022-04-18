import 'dart:convert';

import 'package:blog_teste_tecnico/data/webclient.dart';
import 'package:blog_teste_tecnico/domain/entities/post.dart';
import 'package:blog_teste_tecnico/domain/repositories/ipost_repository.dart';
import 'package:http/http.dart' as http;

class PostRepository implements IPostRepository {
  @override
  Future<List<Post>> findAllPosts() async {
    final http.Response response =
        await client.get(Uri.parse('$baseUrl/posts'));

    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar posts');
    }
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<Post> posts =
        decodedJson.map((dynamic json) => Post.fromJson(json)).toList();
    return posts;
  }

  @override
  Future<List<Post>> findAllPostsByUser(int idUser) async {
    final http.Response response =
        await client.get(Uri.parse('$baseUrl/posts'));

    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar posts');
    }
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<dynamic> userJson = [];
    for (int index = 0; index < decodedJson.length; index++) {
      if (decodedJson[index]['userId'] == idUser) {
        userJson.add(decodedJson[index]);
      }
    }
    final List<Post> postsUser =
        userJson.map((dynamic json) => Post.fromJson(json)).toList();
    return postsUser;
  }

  @override
  Future<Post> findPostById(int id) async {
    final http.Response response =
        await client.get(Uri.parse('$baseUrl/posts/$id'));

    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar post');
    }
    Map<String, dynamic> decodedJson = jsonDecode(response.body);
    return Post.fromJson(decodedJson);
  }

  @override
  Future<Post> savePost(Post post) async {
    final String postJson = jsonEncode(post.toJson());
    final http.Response response = await client
        .post(Uri.parse('$baseUrl/posts'), headers: headerAPI, body: postJson);
    if (response.statusCode != 201) {
      throw Exception('Falha na nova postagem');
    }
    return Post.fromJson(jsonDecode(response.body));
  }

  @override
  Future<Post> updatePost(int id, Post post) async {
    final String updateJson = jsonEncode(post.toJson());
    final http.Response response = await client.put(
        Uri.parse('$baseUrl/posts/$id'),
        headers: headerAPI,
        body: updateJson);
    if (response.statusCode != 200) {
      throw Exception('Falha no update');
    }
    return Post.fromJson(jsonDecode(response.body));
  }

  @override
  Future<http.Response> deletePost(int id) async {
    final http.Response response = await client.delete(
      Uri.parse('$baseUrl/posts/$id'),
      headers: headerAPI,
    );
    if (response.statusCode != 200) {
      throw Exception('Falha ao deletar postagem');
    }
    return response;
  }
}
