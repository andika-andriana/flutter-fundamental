import 'package:mobx/mobx.dart';
part 'counter_mobx.g.dart';

class CounterMobx = CounterBase with _$CounterMobx;

abstract class CounterBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  @action
  void decrement() {
    value--;
  }
}
