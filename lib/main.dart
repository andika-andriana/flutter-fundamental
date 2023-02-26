import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HeroAnimationExample(),
    );
  }
}

class HeroAnimationExample extends StatelessWidget {
  const HeroAnimationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: const Text(
          "Hero Animation Example",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const HeroAnimationDetailExample();
          }));
        },
        child: Hero(
          tag: "avatar",
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100 / 2),
            child: const SizedBox(
              width: 100,
              height: 100,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://media.licdn.com/dms/image/C5603AQE9N7B89s3HBQ/profile-displayphoto-shrink_400_400/0/1649749505592?e=1683158400&v=beta&t=ruw4t9nkui92bxL0_K8F7Jcmr7HBjONSE-Sr8mzwMJQ",
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HeroAnimationDetailExample extends StatelessWidget {
  const HeroAnimationDetailExample({super.key});
  double getWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: const Text(
          "Hero Animation Detail Example",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      // ignore: sized_box_for_whitespace
      body: Container(
        width: getWidth(context),
        height: getWidth(context),
        child: const Hero(
          tag: "avatar",
          child: SizedBox(
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(
                "https://media.licdn.com/dms/image/C5603AQE9N7B89s3HBQ/profile-displayphoto-shrink_400_400/0/1649749505592?e=1683158400&v=beta&t=ruw4t9nkui92bxL0_K8F7Jcmr7HBjONSE-Sr8mzwMJQ",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
