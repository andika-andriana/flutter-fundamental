import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/color_bloc_package.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleBlocPackageStateManagementPage();
  }
}

/// to avoid error use bellow class at withoud MaterialApp(...) at the top
class SingleBlocPackageStateManagementPage extends StatelessWidget {
  const SingleBlocPackageStateManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColorBlocPackage(),
      child: const SingleBlocPackageStateManagement(),
    );
  }
}

class SingleBlocPackageStateManagement extends StatefulWidget {
  const SingleBlocPackageStateManagement({super.key});

  @override
  State<SingleBlocPackageStateManagement> createState() =>
      _SingleBlocPackageStateManagementState();
}

class _SingleBlocPackageStateManagementState
    extends State<SingleBlocPackageStateManagement> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black45,
          title: BlocBuilder<ColorBlocPackage, Color>(
            builder: (context, state) => Text(
              "Single Bloc Package State Management",
              style: TextStyle(color: state),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<ColorBlocPackage, Color>(
                builder: (context, state) => Container(
                  width: 200,
                  height: 200,
                  color: state,
                  margin: const EdgeInsets.only(bottom: 10),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Amber"),
                  Switch(
                      activeColor: Colors.lightBlue,
                      inactiveTrackColor: Colors.amber[200],
                      inactiveThumbColor: Colors.amber,
                      value: isActive,
                      onChanged: (switchVal) {
                        (switchVal == true)
                            ? context
                                .read<ColorBlocPackage>()
                                .add(ColortoLightBlue())
                            : context
                                .read<ColorBlocPackage>()
                                .add(ColortoAmber());
                        setState(() => isActive = switchVal);
                      }),
                  const Text("Light Blue"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
