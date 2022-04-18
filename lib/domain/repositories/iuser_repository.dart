import 'package:blog_teste_tecnico/domain/entities/user.dart';

abstract class IUserRepository {
  Future<List<dynamic>> findAllUser();

  Future<dynamic> findUserByID(int id);

  Future<dynamic> saveUser(User user);

  Future<dynamic> updateUser(int id, User user);

  Future<dynamic> deleteUser(int id);

}