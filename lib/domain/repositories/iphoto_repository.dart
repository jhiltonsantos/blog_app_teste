import 'package:blog_teste_tecnico/domain/entities/photo.dart';

abstract class IPhotoRepository {
  Future<List<dynamic>> findAllPhotos();

  Future<dynamic> findPhotoById(int id);

  Future<dynamic> savePhoto(Photo photo);

  Future<dynamic> updatePhoto(int id, Photo photo);

  Future<dynamic> deletePhoto(int id);

}