import 'package:blog_teste_tecnico/core/usecases/usecase.dart';
import 'package:blog_teste_tecnico/features/blog/data/repositories/user_repository.dart';
import 'package:blog_teste_tecnico/features/blog/domain/entities/user.dart';
import 'package:injectable/injectable.dart';

@injectable
class FindAllUsers extends UserCase<List<User>, NoParams> {
  final UserRepository userRepository;

  FindAllUsers(this.userRepository);

  @override
  Future<List<User>> call(NoParams params) {
    return userRepository.findAllUser();
  }
}
