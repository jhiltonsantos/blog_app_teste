import 'package:blog_teste_tecnico/core/usecases/usecase.dart';
import 'package:blog_teste_tecnico/features/blog/data/repositories/photo_repository.dart';
import 'package:blog_teste_tecnico/features/blog/domain/entities/photo.dart';
import 'package:injectable/injectable.dart';

@injectable
class FindAllPhotos extends UserCase<List<Photo>, NoParams> {
  final PhotoRepository photoRepository;

  FindAllPhotos(this.photoRepository);

  @override
  Future<List<Photo>> call(NoParams params) async {
    return await photoRepository.findAllPhotos();
  }
}
