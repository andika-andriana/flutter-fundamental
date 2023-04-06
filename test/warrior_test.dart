import 'package:flutter_application_1/model/warrior.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'warrior_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<Warrior>(
      onMissingStub: OnMissingStub.returnDefault,
    )
  ],
)
void main() {
  Warrior warrior = Warrior();
  MockWarrior mockWarrior = MockWarrior();

  test("Warrior Test", () {
    expect(warrior.name, equals("no name"));
  });

  test("Default Demo null safety", () {
    expect(mockWarrior.name, isEmpty);
  });

  test("Then Return Demo", () {
    when(mockWarrior.name).thenReturn("no name");
    expect(mockWarrior.name, equals("no name"));
  });

  test("Then Throw Demo", () {
    when(mockWarrior.testMonster()).thenThrow(Exception("Throw Demo"));
    expect(() => mockWarrior.testMonster(), throwsException);
  });

  test("Then Answer Demo", () async {
    when(mockWarrior.training()).thenAnswer((_) {
      return Future.value(true);
    });

    bool result = await mockWarrior.training();
    verify(mockWarrior.training());
    expect(result, equals(true));
  });
}
