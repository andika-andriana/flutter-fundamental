import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/color_bloc_hydrated.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HydratedBlocPackageStateManagementPage();
  }
}

class HydratedBlocPackageStateManagementPage extends StatelessWidget {
  const HydratedBlocPackageStateManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColorBlocHydratedPackage(),
      child: const HydratedBlocPackageStateManagement(),
    );
  }
}

class HydratedBlocPackageStateManagement extends StatefulWidget {
  const HydratedBlocPackageStateManagement({super.key});

  @override
  State<HydratedBlocPackageStateManagement> createState() =>
      _HydratedBlocPackageStateManagementState();
}

class _HydratedBlocPackageStateManagementState
    extends State<HydratedBlocPackageStateManagement> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black45,
          title: BlocBuilder<ColorBlocHydratedPackage, Color>(
            builder: (context, state) => Text(
              "Hydrated Bloc Package State Management",
              style: TextStyle(color: state),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<ColorBlocHydratedPackage, Color>(
                builder: (context, color) => Container(
                  width: 200,
                  height: 200,
                  color: color,
                  margin: const EdgeInsets.only(bottom: 10),
                ),
              ),
              BlocBuilder<ColorBlocHydratedPackage, Color>(
                builder: (context, color) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<ColorBlocHydratedPackage>()
                            .add(ColorHydratedtoAmber());
                      },
                      child: Text(
                        "Amber".toUpperCase(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<ColorBlocHydratedPackage>()
                            .add(ColorHydratedtoLightBlue());
                      },
                      child: Text(
                        "Light Blue".toUpperCase(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
