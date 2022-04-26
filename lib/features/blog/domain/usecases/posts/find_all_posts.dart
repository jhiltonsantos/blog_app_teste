import 'package:blog_teste_tecnico/core/usecases/usecase.dart';
import 'package:blog_teste_tecnico/features/blog/data/repositories/post_repository.dart';
import 'package:blog_teste_tecnico/features/blog/domain/entities/post.dart';
import 'package:injectable/injectable.dart';

@injectable
class FindAllPosts extends UserCase<List<Post>, NoParams> {
  final PostRepository postRepository;

  FindAllPosts(this.postRepository);

  @override
  Future<List<Post>> call(NoParams params) {
    return postRepository.findAllPosts();
  }
}
