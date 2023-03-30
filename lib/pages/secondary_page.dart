import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/multi_color_bloc.dart';
import 'package:flutter_application_1/bloc/multi_counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondaryPage extends StatelessWidget {
  const SecondaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MultiColorBloc, Color>(
      builder: (context, colorBloc) => Scaffold(
        appBar: AppBar(
          backgroundColor: colorBloc,
          title: const Text("Secondary Page"),
        ),
        body: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<MultiCounterBloc, int>(
                builder: (context, counterBloc) => Material(
                  borderRadius: BorderRadius.circular(8),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    splashColor: Colors.white.withOpacity(0.1),
                    onTap: () {
                      context.read<MultiCounterBloc>().add(
                            IncrementPressed(counterBloc + 1),
                          );
                    },
                    child: Text(
                      counterBloc.toString(),
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 60,
                        fontWeight: FontWeight.w600,
                        color: colorBloc,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Material(
                    color: Colors.red,
                    shape: (colorBloc == Colors.red)
                        ? const CircleBorder(
                            side: BorderSide(
                              color: Colors.amber,
                              width: 5,
                              strokeAlign: BorderSide.strokeAlignOutside,
                            ),
                          )
                        : const CircleBorder(),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50 / 2),
                      splashColor: Colors.white.withOpacity(0.1),
                      onTap: () => context.read<MultiColorBloc>().add(ToRed()),
                      child: const SizedBox(height: 50, width: 50),
                    ),
                  ),
                  Material(
                    color: Colors.green,
                    shape: (colorBloc == Colors.green)
                        ? const CircleBorder(
                            side: BorderSide(
                              color: Colors.amber,
                              width: 5,
                              strokeAlign: BorderSide.strokeAlignOutside,
                            ),
                          )
                        : const CircleBorder(),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50 / 2),
                      splashColor: Colors.white.withOpacity(0.1),
                      onTap: () =>
                          context.read<MultiColorBloc>().add(ToGreen()),
                      child: const SizedBox(height: 50, width: 50),
                    ),
                  ),
                  Material(
                    color: Colors.blue,
                    shape: (colorBloc == Colors.blue)
                        ? const CircleBorder(
                            side: BorderSide(
                              color: Colors.amber,
                              width: 5,
                              strokeAlign: BorderSide.strokeAlignOutside,
                            ),
                          )
                        : const CircleBorder(),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50 / 2),
                      splashColor: Colors.white.withOpacity(0.1),
                      onTap: () => context.read<MultiColorBloc>().add(ToBlue()),
                      child: const SizedBox(height: 50, width: 50),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
