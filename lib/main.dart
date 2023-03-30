import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/monster_hive.dart';
import 'package:flutter_application_1/pages/monster_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var appDirectory = await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDirectory.path);
  Hive.registerAdapter(MonsterHiveAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MonsterPage();
  }
}
