import 'package:blog_teste_tecnico/core/usecases/usecase.dart';
import 'package:blog_teste_tecnico/features/blog/data/repositories/post_repository.dart';
import 'package:blog_teste_tecnico/features/blog/domain/entities/post.dart';
import 'package:injectable/injectable.dart';

@injectable
class SavePost extends UserCase<Post, NoParams> {
  final PostRepository postRepository;
  final Post post;

  SavePost({required this.postRepository, required this.post});

  @override
  Future<Post> call(NoParams params) async {
    return postRepository.savePost(post);
  }
}
