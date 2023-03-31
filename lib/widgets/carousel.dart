import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/movie_card.dart';

class Carousel extends StatelessWidget {
  final List<String> urls = [
    "https://picsum.photos/id/0/500/250",
    "https://picsum.photos/id/1/500/250",
    "https://picsum.photos/id/2/500/250",
    "https://picsum.photos/id/3/500/250",
    "https://picsum.photos/id/4/500/250"
  ];

  final PageController pageController = PageController(viewportFraction: 0.95);

  Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: urls.length,
      itemBuilder: (context, index) => MovieCard(imageUrl: urls[index]),
    );
  }
}
