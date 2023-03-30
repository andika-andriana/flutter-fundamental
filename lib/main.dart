import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/user_bloc.dart';
import 'package:flutter_application_1/pages/user_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MvvmArchitectureExample();
  }
}

class MvvmArchitectureExample extends StatelessWidget {
  const MvvmArchitectureExample({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: UserPage(),
    );
  }
}
