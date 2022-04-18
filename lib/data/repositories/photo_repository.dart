import 'dart:convert';

import 'package:blog_teste_tecnico/data/webclient.dart';
import 'package:blog_teste_tecnico/domain/entities/photo.dart';
import 'package:blog_teste_tecnico/domain/repositories/iphoto_repository.dart';
import 'package:http/http.dart' as http;

class PhotoRepository implements IPhotoRepository {

  @override
  Future<List<Photo>> findAllPhotos() async {
    final http.Response response =
        await client.get(Uri.parse('$baseUrl/photos'));
    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar as fotos');
    }
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<Photo> photos =
        decodedJson.map((dynamic json) => Photo.fromJson(json)).toList();
    return photos;
  }

  @override
  Future<Photo> findPhotoById(int id) async {
    final http.Response response =
        await client.get(Uri.parse('$baseUrl/photos/$id'));
    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar foto');
    }
    Map<String, dynamic> decodedJson = jsonDecode(response.body);
    return Photo.fromJson(decodedJson);
  }

  @override
  Future<Photo> savePhoto(Photo photo) async {
    final String photoJson = jsonEncode(photo.toJson());
    final http.Response response = await client.post(
        Uri.parse('$baseUrl/photos'),
        headers: headerAPI,
        body: photoJson);
    if (response.statusCode != 201) {
      throw Exception('Falha em inserir nova foto');
    }
    return Photo.fromJson(jsonDecode(response.body));
  }

  @override
  Future<Photo> updatePhoto(int id, Photo photo) async {
    final String updateJson = jsonEncode(photo.toJson());
    final http.Response response = await client.put(
        Uri.parse('$baseUrl/photos/$id'),
        headers: headerAPI,
        body: updateJson);
    if (response.statusCode != 200) {
      throw Exception('Falha ao atualizar url da foto');
    }
    return Photo.fromJson(jsonDecode(response.body));
  }

  @override
  Future<http.Response> deletePhoto(int id) async {
    final http.Response response = await client.delete(
      Uri.parse('$baseUrl/photos/$id'),
      headers: headerAPI,
    );
    if (response.statusCode != 200) {
      throw Exception('Falha ao deletar foto');
    }
    return response;
  }
}
