import 'package:blog_teste_tecnico/core/usecases/usecase.dart';
import 'package:blog_teste_tecnico/features/blog/data/repositories/post_repository.dart';
import 'package:blog_teste_tecnico/features/blog/domain/entities/post.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdatePost extends UserCase<Post, NoParams> {
  final int id;
  final Post post;
  final PostRepository postRepository;

  UpdatePost(this.id, this.post, this.postRepository);

  @override
  Future<Post> call(NoParams params) async {
    return postRepository.updatePost(id, post);
  }
}
