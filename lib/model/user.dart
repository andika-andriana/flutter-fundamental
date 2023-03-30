import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class User {
  int id;
  String name, avatar;

  User(this.id, this.name, this.avatar);

  factory User.createUser(Map<String, dynamic> object) {
    return User(
      object['id'],
      object['first_name'] + " " + object['last_name'],
      object['avatar'],
    );
  }

  static Future<User> getFromApi(String id) async {
    final url = Uri.https('reqres.in', '/api/users/$id');
    final apiResult = await http.get(url);
    final jsonObject = convert.jsonDecode(apiResult.body);
    final userData = (jsonObject as Map<String, dynamic>)['data'];

    return User.createUser(userData);
  }
}

class UnitializedUser extends User {
  UnitializedUser(super.id, super.name, super.avatar);
}
