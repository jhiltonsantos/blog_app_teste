import 'package:blog_teste_tecnico/core/usecases/usecase.dart';
import 'package:blog_teste_tecnico/features/blog/data/repositories/user_repository.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@injectable
class DeleteUser extends UserCase<http.Response, NoParams> {
  final UserRepository userRepository;
  final int id;

  DeleteUser(this.userRepository, this.id);

  @override
  Future<http.Response> call(NoParams params) {
    return userRepository.deleteUser(id);
  }
}
