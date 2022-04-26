import 'package:blog_teste_tecnico/core/usecases/usecase.dart';
import 'package:blog_teste_tecnico/features/blog/data/repositories/photo_repository.dart';
import 'package:blog_teste_tecnico/features/blog/domain/entities/photo.dart';
import 'package:injectable/injectable.dart';

@injectable
class FindByIdPhoto extends UserCase<Photo, NoParams> {
  final PhotoRepository photoRepository;
  final int id;

  FindByIdPhoto(this.photoRepository, this.id);

  @override
  Future<Photo> call(NoParams params) async {
    return await photoRepository.findPhotoById(id);
  }
}