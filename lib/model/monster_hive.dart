import 'package:hive/hive.dart';
part 'monster_hive.g.dart';

@HiveType(typeId: 0, adapterName: "MonsterHiveAdapter")
class Monster {
  @HiveField(0)
  String name;
  @HiveField(1)
  int level;

  Monster(this.name, this.level);
}
