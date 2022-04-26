import 'package:blog_teste_tecnico/core/usecases/usecase.dart';
import 'package:blog_teste_tecnico/features/blog/data/repositories/user_repository.dart';
import 'package:blog_teste_tecnico/features/blog/domain/entities/user.dart';
import 'package:injectable/injectable.dart';

@injectable
class FindByIdUser extends UserCase<User, NoParams> {
  final UserRepository userRepository;
  final int id;

  FindByIdUser(this.userRepository, this.id);

  @override
  Future<User> call(NoParams params) async {
    return await userRepository.findUserByID(id);
  }
}
