import 'package:blog_teste_tecnico/domain/entities/user.dart';
import 'package:http/http.dart' as http;

abstract class IUserRepository {
  Future<List<User>> findAllUser();

  Future<User> findUserByID(int id);

  Future<User> saveUser(User user);

  Future<User> updateUser(int id, User user);

  Future<http.Response> deleteUser(int id);

}