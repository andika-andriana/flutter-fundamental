import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController usernameTextController =
      TextEditingController(text: "");
  TextEditingController passwordTextController =
      TextEditingController(text: "");

  bool isSecure = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.text_fields,
            size: 18,
            color: Colors.black,
          ),
          title: const Text(
            "Text Decoration Example",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.lightBlue],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
              ),
              image: DecorationImage(
                image: AssetImage("images/app_bar_bg.png"),
                fit: BoxFit.none,
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: const Icon(
                      Icons.facebook_outlined,
                      size: 50,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    "Facelook".toUpperCase(),
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 50,
                      fontStyle: FontStyle.normal,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 24),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Username",
                          prefixIcon: const Icon(Icons.account_circle_outlined),
                          hintText: "Input username",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: usernameTextController,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 24),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: const Icon(Icons.lock),
                          hintText: "Input password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          suffix: GestureDetector(
                            onTap: () {
                              setState(() {
                                isSecure = !isSecure;
                              });
                            },
                            child: (isSecure)
                                ? const Icon(
                                    Icons.no_encryption,
                                    size: 14,
                                    color: Colors.amber,
                                  )
                                : const Icon(
                                    Icons.lock,
                                    size: 14,
                                    color: Colors.amber,
                                  ),
                          ),
                        ),
                        obscureText: isSecure,
                        maxLength: 8,
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: passwordTextController,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Login"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
