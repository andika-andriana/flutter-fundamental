import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const DropdownButtonExample();
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  Person? selectedPerson;
  List<Person> persons = [Person("Budi"), Person("Agus"), Person("Doni")];

  List<DropdownMenuItem> generateItems(List<Person> persons) {
    List<DropdownMenuItem> items = [];
    for (var person in persons) {
      items.add(
        DropdownMenuItem(
          value: person,
          child: Text(person.name),
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dropdown Button Example"),
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Select favorite name below"),
              DropdownButton(
                icon: const Icon(Icons.person),
                isExpanded: true,
                items: generateItems(persons),
                onChanged: (value) {
                  setState(() {
                    selectedPerson = value;
                  });
                },
                value: selectedPerson,
              ),
              const SizedBox(height: 16),
              selectedPerson != null
                  ? Text(
                      "Selected is : ${selectedPerson?.name}",
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    )
                  : const SizedBox(
                      width: 10,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class Person {
  String name;
  Person(this.name);
}
