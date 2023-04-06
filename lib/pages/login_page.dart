import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/firebase_auth_services.dart';
// import 'package:flutter_application_1/pages/main_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;
  double getLargeDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 21, 21),
      body: Stack(
        children: <Widget>[
          Positioned(
            right: -getSmallDiameter(context) / 3,
            top: -getSmallDiameter(context) / 3,
            child: Container(
              width: getSmallDiameter(context),
              height: getSmallDiameter(context),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.pink, Colors.blue],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )),
            ),
          ),
          Positioned(
            left: -getLargeDiameter(context) / 4,
            top: -getLargeDiameter(context) / 4,
            child: Container(
              width: getLargeDiameter(context),
              height: getLargeDiameter(context),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.pink, Colors.blue],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )),
              child: const Center(
                child: Text(
                  "IS MY LIFE",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 30,
                    fontFamily: "Poppins",
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.double,
                    decorationThickness: 0.5,
                    decorationColor: Colors.amber,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: -getSmallDiameter(context) / 4,
            bottom: -getSmallDiameter(context) / 4,
            child: Container(
              width: getSmallDiameter(context),
              height: getSmallDiameter(context),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(40, 255, 2, 192),
              ),
            ),
          ),
          Align(
            child: ListView(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(167, 159, 153, 153),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: const EdgeInsets.fromLTRB(20, 300, 20, 10),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.email,
                            color: Colors.white60,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white30),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.pink)),
                          labelText: "Email ",
                          labelStyle: TextStyle(color: Colors.white70),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                      TextField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.password,
                            color: Colors.white60,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white30),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.pink)),
                          labelText: "Password ",
                          labelStyle: TextStyle(color: Colors.white70),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                    child: const Text(
                      "FORGOT PASSWORD? ",
                      style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 40,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                              colors: [Colors.pink, Colors.blue],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              splashColor: Colors.blue,
                              onTap: () async {
                                await FirebaseAuthServices.signInEmail(
                                  emailController.text,
                                  passwordController.text,
                                );
                              },
                              child: const Center(
                                child: Text(
                                  "SIGN IN",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {},
                        mini: true,
                        elevation: 5,
                        child: const Image(
                          image: AssetImage("images/facebook.png"),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {},
                        mini: true,
                        elevation: 5,
                        child: const Image(
                          image: AssetImage("images/twitter.png"),
                        ),
                      ),
                      FloatingActionButton(
                          onPressed: () async {
                            await FirebaseAuthServices.signInAnonymously();
                          },
                          mini: true,
                          elevation: 5,
                          child: const Icon(Icons.skip_next_rounded)),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "DON'T HAVE ACCOUNT? ",
                      style: TextStyle(
                        color: Colors.white38,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await FirebaseAuthServices.signUpEmail(
                          emailController.text,
                          passwordController.text,
                        );
                      },
                      child: const Text(
                        "SIGN UP",
                        style: TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
