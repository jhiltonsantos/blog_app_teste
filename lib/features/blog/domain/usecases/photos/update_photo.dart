import 'package:blog_teste_tecnico/core/usecases/usecase.dart';
import 'package:blog_teste_tecnico/features/blog/data/repositories/photo_repository.dart';
import 'package:blog_teste_tecnico/features/blog/domain/entities/photo.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdatePhoto extends UserCase<Photo, NoParams> {
  final int id;
  final Photo photo;
  final PhotoRepository photoRepository;

  UpdatePhoto(
      {required this.id, required this.photo, required this.photoRepository});

  @override
  Future<Photo> call(NoParams params) async {
    return photoRepository.updatePhoto(id, photo);
  }
}
