import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/monster_hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MonsterPage extends StatelessWidget {
  const MonsterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Monster Page"),
        ),
        body: FutureBuilder(
          future: Hive.openBox("monsters"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                var monsterBox = Hive.box("monsters");
                if (monsterBox.isEmpty) {
                  monsterBox.add(Monster("Gabon", 1));
                  monsterBox.add(Monster("CongCorang", 20));
                }
                return ValueListenableBuilder<Box>(
                  valueListenable: monsterBox.listenable(),
                  builder: (context, monsters, child) => Container(
                    margin: const EdgeInsets.all(20),
                    child: ListView.builder(
                      itemCount: monsters.length,
                      itemBuilder: (context, index) {
                        Monster monster = monsters.getAt(index);
                        return Container(
                            padding: const EdgeInsets.all(16),
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  offset: const Offset(1, 1),
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      monster.name,
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.7),
                                        fontFamily: "Poppins",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      " [${monster.level}]",
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.7),
                                        fontFamily: "Poppins",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        monsters.putAt(
                                          index,
                                          Monster(
                                            monster.name,
                                            monster.level + 1,
                                          ),
                                        );
                                      },
                                      color: Colors.green,
                                      icon: const Icon(Icons.arrow_upward),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        monsters.add(
                                          Monster(
                                            monster.name,
                                            monster.level,
                                          ),
                                        );
                                      },
                                      color: Colors.blue,
                                      icon: const Icon(Icons.copy),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        monsters.deleteAt(index);
                                      },
                                      color: Colors.red,
                                      icon: const Icon(Icons.delete),
                                    ),
                                  ],
                                )
                              ],
                            ));
                      },
                    ),
                  ),
                );
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
