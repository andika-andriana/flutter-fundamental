import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Event being processed by [CounterBloc].
abstract class ColorEventPackage {}

/// Notifies bloc to increment state.
class ColortoAmber extends ColorEventPackage {}

/// Notifies bloc to decrement state.
class ColortoLightBlue extends ColorEventPackage {}

class ColorBlocPackage extends Bloc<ColorEventPackage, Color> {
  ColorBlocPackage() : super(Colors.amber) {
    on<ColortoAmber>((event, emit) => emit(Colors.amber));
    on<ColortoLightBlue>((event, emit) => emit(Colors.lightBlue));
  }
}
