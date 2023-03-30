import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class MultiColorBlocEvent {}

class ToRed extends MultiColorBlocEvent {}

class ToGreen extends MultiColorBlocEvent {}

class ToBlue extends MultiColorBlocEvent {}

class MultiColorBloc extends Bloc<MultiColorBlocEvent, Color> {
  MultiColorBloc() : super(Colors.red) {
    on<ToRed>((event, emit) => emit(Colors.red));
    on<ToGreen>((event, emit) => emit(Colors.green));
    on<ToBlue>((event, emit) => emit(Colors.blue));
  }
}
