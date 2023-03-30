import 'package:flutter_bloc/flutter_bloc.dart';

abstract class MultiCounterBlocEvent {}

class IncrementPressed extends MultiCounterBlocEvent {
  int newInt;
  IncrementPressed(this.newInt);
}

class MultiCounterBloc extends Bloc<MultiCounterBlocEvent, int> {
  MultiCounterBloc() : super(1) {
    on<IncrementPressed>((event, emit) => emit(event.newInt));
  }
}
