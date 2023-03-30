import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/multi_color_bloc.dart';
import 'package:flutter_application_1/bloc/multi_counter_bloc.dart';
import 'package:flutter_application_1/pages/primary_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MultipleBlocAtMultiplePage();
  }
}

class MultipleBlocAtMultiplePage extends StatelessWidget {
  const MultipleBlocAtMultiplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (context) => MultiColorBloc()),
        BlocProvider(create: (context) => MultiCounterBloc()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PrimaryPage(),
      ),
    );
  }
}
