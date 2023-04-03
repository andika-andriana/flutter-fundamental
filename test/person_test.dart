import 'package:flutter_application_1/model/person.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Person person = Person();

  group("Person field basic test", () {
    test("Peson name & age unit test", () {
      // https://api.flutter.dev/flutter/package-matcher_matcher/package-matcher_matcher-library.html
      expect(person.name, equals("no name"));
      expect(person.age, equals(1));

      expect(person.age, isPositive);
    });
  });

  group("Person field advance test", () {
    test("Lucky number person unit test", () {
      expect(
          person.luckyNumbers,
          allOf([
            hasLength(equals(3)),
            isNot(anyElement(isNegative)),
          ]));
    });
  });
}
