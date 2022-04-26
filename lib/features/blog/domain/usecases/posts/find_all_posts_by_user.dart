import 'package:blog_teste_tecnico/core/usecases/usecase.dart';
import 'package:blog_teste_tecnico/features/blog/data/repositories/post_repository.dart';
import 'package:blog_teste_tecnico/features/blog/domain/entities/post.dart';
import 'package:injectable/injectable.dart';

@injectable
class FindAllPostsByUser extends UserCase<List<Post>, NoParams> {
  final PostRepository postRepository;
  final int idUser;

  FindAllPostsByUser(this.postRepository, this.idUser);

  @override
  Future<List<Post>> call(NoParams params) async {
    return await postRepository.findAllPostsByUser(idUser);
  }
}
