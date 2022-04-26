import 'package:blog_teste_tecnico/core/usecases/usecase.dart';
import 'package:blog_teste_tecnico/features/blog/data/repositories/photo_repository.dart';
import 'package:http/http.dart';

class DeletePhoto extends UserCase<Response, NoParams> {
  final PhotoRepository photoRepository;
  final int id;

  DeletePhoto(this.photoRepository, this.id);

  @override
  Future<Response> call(NoParams params) {
   return photoRepository.deletePhoto(id);
  }
}