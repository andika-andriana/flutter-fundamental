import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Event being processed by [CounterBloc].
abstract class ColorEvent {}

/// Notifies bloc to increment state.
class ColortoAmber extends ColorEvent {}

/// Notifies bloc to decrement state.
class ColortoLightBlue extends ColorEvent {}

class ColorBlocPackage extends Bloc<ColorEvent, Color> {
  ColorBlocPackage() : super(Colors.amber) {
    on<ColortoAmber>((event, emit) => emit(Colors.amber));
    on<ColortoLightBlue>((event, emit) => emit(Colors.lightBlue));
  }
}
