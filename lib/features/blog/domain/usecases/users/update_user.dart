import 'package:blog_teste_tecnico/core/usecases/usecase.dart';
import 'package:blog_teste_tecnico/features/blog/data/repositories/user_repository.dart';
import 'package:blog_teste_tecnico/features/blog/domain/entities/user.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateUser extends UserCase<User, NoParams> {
  final int id;
  final User user;
  final UserRepository userRepository;

  UpdateUser(this.id, this.user, this.userRepository);

  @override
  Future<User> call(NoParams params) async {
    return userRepository.updateUser(id, user);
  }
}
