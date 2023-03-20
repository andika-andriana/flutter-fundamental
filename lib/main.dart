import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/color_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SingleBlocStateManagement(),
    );
  }
}

class SingleBlocStateManagement extends StatefulWidget {
  const SingleBlocStateManagement({super.key});

  @override
  State<SingleBlocStateManagement> createState() =>
      _SingleBlocStateManagementState();
}

class _SingleBlocStateManagementState extends State<SingleBlocStateManagement> {
  ColorBloc bloc = ColorBloc();
  bool isActive = false;

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black45,
          title: const Text("Single Bloc State Management"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder(
                stream: bloc.stateStream,
                initialData: Colors.amber,
                builder: (context, snapshot) => Container(
                  width: 200,
                  height: 200,
                  color: snapshot.data,
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
                            ? bloc.eventSink.add(ColorEvent.toLightBlue)
                            : bloc.eventSink.add(ColorEvent.toAmber);
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
