import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class GetResult {
  int id;
  String name;

  GetResult({required this.id, required this.name});

  factory GetResult.createGetResult(Map<String, dynamic> object) {
    return GetResult(
      id: object['id'],
      name: object['first_name'] + " " + object['last_name'],
    );
  }

  static Future<GetResult> getFromApi(String id) async {
    final url = Uri.https('reqres.in', '/api/users/$id');
    final apiResult = await http.get(url);
    final jsonObject = convert.jsonDecode(apiResult.body);
    final userData = (jsonObject as Map<String, dynamic>)['data'];

    return GetResult.createGetResult(userData);
  }
}
