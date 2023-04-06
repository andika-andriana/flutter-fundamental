import 'package:flutter_application_1/model/person_equatable.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter_test/flutter_test.dart';

void main() {
  // SAMPLE 1 ---------------
  PersonNotEquatable personNotEquatable =
      PersonNotEquatable(name: "Andi 1", age: 11);

  test("Not Equatable Demo", () {
    expect(
        personNotEquatable, isNot(PersonNotEquatable(name: "Andi 1", age: 11)));
  });

  // SAMPLE 2 ---------------
  PersonEquatable personEquatable =
      const PersonEquatable(name: "Andi 2", age: 22);

  test("Equatable Demo", () {
    expect(personEquatable, const PersonEquatable(name: "Andi 2", age: 22));
  });

  // SAMPLE 3 ---------------
  PersonMixinEquatable personMixinEquatable =
      PersonMixinEquatable(name: "Andi 3", age: 33);

  test("Equatable Mixin Demo", () {
    expect(personMixinEquatable, PersonMixinEquatable(name: "Andi 3", age: 33));
  });
}
