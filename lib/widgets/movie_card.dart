import 'package:division/division.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String imageUrl;
  final double scale;

  const MovieCard({super.key, required this.imageUrl, required this.scale});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      height: 400 * scale,
      width: 300 * scale,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey,
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(1, 1),
            blurRadius: 5,
          )
        ],
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
