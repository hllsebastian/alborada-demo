import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EventImage extends StatelessWidget {
  const EventImage(this.urlImage, {super.key});
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: urlImage,
        placeholder: (context, url) => _DefaultImage(),
        errorWidget: (context, url, error) => _DefaultImage());
  }
}

class _DefaultImage extends StatelessWidget {
  const _DefaultImage();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset('assets/images/png/holder_image_circle.png'));
  }
}
