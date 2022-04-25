import 'package:blog_teste_tecnico/domain/entities/photo.dart';
import 'package:flutter/material.dart';

class PhotoItem extends StatelessWidget {
  final Photo photo;
  final Function onTap;

  const PhotoItem({Key? key, required this.onTap, required this.photo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Card(
        borderOnForeground: true,
        elevation: 5,
        color: Colors.white70,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: GestureDetector(
                onTap: () => onTap(),
                child: Center(
                  child: Image.network(
                    photo.url!,
                    scale: 0.5,
                    width: 300,
                    height: 300,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 10.0, bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Imagem: ${photo.id!.toString()}",
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Álbum: ${photo.albumId!.toString()}",
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
