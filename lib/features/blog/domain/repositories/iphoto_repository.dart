import 'package:blog_teste_tecnico/features/blog/domain/entities/photo.dart';
import 'package:http/http.dart' as http;

abstract class IPhotoRepository {
  Future<List<Photo>> findAllPhotos();

  Future<Photo> findPhotoById(int id);

  Future<Photo> savePhoto(Photo photo);

  Future<Photo> updatePhoto(int id, Photo photo);

  Future<http.Response> deletePhoto(int id);

}