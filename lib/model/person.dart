class Person {
  late String name;
  late int age;
  List luckyNumbers = [];

  Person() {
    name = "no name";
    age = 1;

    for (var i = 0; i < 3; i++) {
      luckyNumbers.add(i + 1);
    }
  }
}
