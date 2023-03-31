import 'package:division/division.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String imageUrl;
  const MovieCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: ParentStyle()
        ..width(double.infinity)
        ..borderRadius(all: 16)
        ..margin(top: 20, right: 10)
        ..elevation(2)
        ..background.image(
          url: imageUrl,
          fit: BoxFit.cover,
        ),
    );
  }
}
