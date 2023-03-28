import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

/// Event being processed by [CounterBloc].
abstract class ColorEventHydratedPackage {}

/// Notifies bloc to increment state.
class ColorHydratedtoAmber extends ColorEventHydratedPackage {}

/// Notifies bloc to decrement state.
class ColorHydratedtoLightBlue extends ColorEventHydratedPackage {}

class ColorBlocHydratedPackage
    extends HydratedBloc<ColorEventHydratedPackage, Color> {
  ColorBlocHydratedPackage() : super(Colors.amber) {
    on<ColorHydratedtoAmber>((event, emit) => emit(Colors.amber));
    on<ColorHydratedtoLightBlue>((event, emit) => emit(Colors.lightBlue));
  }

  @override
  Color? fromJson(Map<String, dynamic> json) {
    try {
      return Color(json['color'] as int);
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, int>? toJson(Color state) {
    try {
      return {'color': state.value};
    } catch (e) {
      return null;
    }
  }
}
