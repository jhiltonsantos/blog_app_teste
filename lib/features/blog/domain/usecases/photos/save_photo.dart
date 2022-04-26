import 'package:blog_teste_tecnico/core/usecases/usecase.dart';
import 'package:blog_teste_tecnico/features/blog/data/repositories/photo_repository.dart';
import 'package:blog_teste_tecnico/features/blog/domain/entities/photo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SavePhoto extends UserCase<Photo, NoParams> {
  final PhotoRepository photoRepository;
  final Photo photo;

  SavePhoto({required this.photoRepository, required this.photo});

  @override
  Future<Photo> call(NoParams params) async {
    return photoRepository.savePhoto(photo);
  }
}
