import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/list_articles_bloc.dart';
import 'package:flutter_application_1/pages/list_articles_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const InfiniteListWithBlocExample();
  }
}

class InfiniteListWithBlocExample extends StatelessWidget {
  const InfiniteListWithBlocExample({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ListArtclesBloc>(
      create: (context) => ListArtclesBloc()..add(ListArticlesEvent()),
      child: const ListArticlesPage(),
    );
  }
}
