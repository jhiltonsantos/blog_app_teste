import 'package:blog_teste_tecnico/core/usecases/usecase.dart';
import 'package:blog_teste_tecnico/features/blog/data/repositories/post_repository.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@injectable
class DeletePost extends UserCase<http.Response, NoParams> {
  final PostRepository postRepository;
  final int id;

  DeletePost(this.postRepository, this.id);

  @override
  Future<http.Response> call(NoParams params) {
    return postRepository.deletePost(id);
  }
}
