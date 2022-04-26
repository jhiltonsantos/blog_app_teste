import 'dart:convert';

import 'package:blog_teste_tecnico/features/blog/domain/entities/user.dart';
import 'package:blog_teste_tecnico/features/blog/domain/repositories/iuser_repository.dart';
import 'package:http/http.dart' as http;

import '../webclient.dart';

class UserRepository implements IUserRepository {
  @override
  Future<List<User>> findAllUser() async {
    final http.Response response =
        await client.get(Uri.parse('$baseUrl/users'));
    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar usuários');
    }
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<User> users =
        decodedJson.map((dynamic json) => User.fromJson(json)).toList();
    return users;
  }

  @override
  Future<User> findUserByID(int id) async {
    final http.Response response =
        await client.get(Uri.parse('$baseUrl/users/$id'));
    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar usuario');
    }
    return User.fromJson(jsonDecode(response.body));
  }

  @override
  Future<User> saveUser(User user) async {
    final String userJson = jsonEncode(user.toJson());
    final http.Response response = await client
        .post(Uri.parse('$baseUrl/users'), headers: headerAPI, body: userJson);
    if (response.statusCode != 201) {
      throw Exception('Falha em inserir novo usuario');
    }
    return User.fromJson(jsonDecode(response.body));
  }

  @override
  Future<User> updateUser(int id, User user) async {
    final String updateJson = jsonEncode(user.toJson());
    final http.Response response = await client.put(
        Uri.parse('$baseUrl/users/$id'),
        headers: headerAPI,
        body: updateJson);
    if (response.statusCode != 200) {
      throw Exception('Falha ao atualizar nome do usuario');
    }
    return User.fromJson(jsonDecode(response.body));
  }

  @override
  Future<http.Response> deleteUser(int id) async {
    final http.Response response = await client.delete(
      Uri.parse('$baseUrl/users/$id'),
      headers: headerAPI,
    );
    if (response.statusCode != 200) {
      throw Exception('Falha ao deletar usuario');
    }
    return response;
  }
}
