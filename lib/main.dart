import 'package:flutter/material.dart';

import 'package:flutter_application_1/model/album_services.dart';
import 'package:http/http.dart' as http;
import 'model/album.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HttpSimulationMockito();
  }
}

class HttpSimulationMockito extends StatefulWidget {
  const HttpSimulationMockito({super.key});

  @override
  State<HttpSimulationMockito> createState() => _HttpSimulationMockitoState();
}

class _HttpSimulationMockitoState extends State<HttpSimulationMockito> {
  late final Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = AlbumServices().fetchAlbum('1', http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
