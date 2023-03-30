import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/user_bloc.dart';
import 'package:flutter_application_1/model/user.dart';
import 'package:flutter_application_1/widgets/user_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatelessWidget {
  UserPage({super.key});
  final Random r = Random();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("MVVM Architecture Example"),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context
                    .read<UserBloc>()
                    .add(GetUserEvent(r.nextInt(10).toString()));
              },
              child: const Text("Pick User"),
            ),
            BlocBuilder<UserBloc, User>(
              builder: (context, user) {
                return user is UnitializedUser
                    ? Container()
                    : UserCard(user: user);
              },
            ),
          ],
        ),
      ),
    ));
  }
}
