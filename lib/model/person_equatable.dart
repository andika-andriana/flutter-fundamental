import 'package:equatable/equatable.dart';

// SAMPLE 1 ---------------
class PersonNotEquatable {
  final String name;
  final int age;

  PersonNotEquatable({required this.name, required this.age});
}

// SAMPLE 2 ---------------
class PersonEquatable extends Equatable {
  final String name;
  final int age;

  const PersonEquatable({required this.name, required this.age});

  @override
  List<Object?> get props => [name, age];
}

// SAMPLE 3 ---------------
class BasePerson {}

class PersonMixinEquatable extends BasePerson with EquatableMixin {
  final String name;
  final int age;

  PersonMixinEquatable({required this.name, required this.age});

  @override
  List<Object?> get props => [name, age];
}
