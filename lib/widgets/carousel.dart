import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/movie_card.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final List<String> urls = [
    "https://picsum.photos/id/0/300/400",
    "https://picsum.photos/id/1/300/400",
    "https://picsum.photos/id/2/300/400",
    "https://picsum.photos/id/3/300/400",
    "https://picsum.photos/id/4/300/400"
  ];

  final PageController pageController = PageController(viewportFraction: 0.7);
  double currentPageValue = 0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPageValue = pageController.page as double;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: urls.length,
      itemBuilder: (context, index) {
        double deference = index - currentPageValue;
        if (deference < 0) {
          deference *= -1;
        }
        deference = min(1, deference);
        return Center(
          child: MovieCard(
            imageUrl: urls[index],
            scale: 1 - (deference * 0.3),
          ),
        );
      },
    );
  }
}
