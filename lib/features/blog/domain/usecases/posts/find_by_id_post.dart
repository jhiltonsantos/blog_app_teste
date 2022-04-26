import 'package:blog_teste_tecnico/core/usecases/usecase.dart';
import 'package:blog_teste_tecnico/features/blog/data/repositories/post_repository.dart';
import 'package:blog_teste_tecnico/features/blog/domain/entities/post.dart';
import 'package:injectable/injectable.dart';

@injectable
class FindByIdPost extends UserCase<Post, NoParams> {
  final PostRepository postRepository;
  final int id;

  FindByIdPost(this.postRepository, this.id);

  @override
  Future<Post> call(NoParams params) async {
    return await postRepository.findPostById(id);
  }
}
