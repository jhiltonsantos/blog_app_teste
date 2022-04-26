import 'package:blog_teste_tecnico/core/usecases/usecase.dart';
import 'package:blog_teste_tecnico/features/blog/data/repositories/user_repository.dart';
import 'package:blog_teste_tecnico/features/blog/domain/entities/user.dart';
import 'package:injectable/injectable.dart';

@injectable
class SaveUser extends UserCase<User, NoParams> {
  final UserRepository userRepository;
  final User user;

  SaveUser(this.userRepository, this.user);

  @override
  Future<User> call(NoParams params) async {
    return userRepository.saveUser(user);
  }
}
