import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class GetListResult {
  int id;
  String name;

  GetListResult({required this.id, required this.name});

  factory GetListResult.createGetListResult(Map<String, dynamic> object) {
    return GetListResult(
      id: object['id'],
      name: object['first_name'] + " " + object['last_name'],
    );
  }

  static Future<List<GetListResult>> getListFromApi(
      String page, String perPage) async {
    final url = Uri.https(
      'reqres.in',
      '/api/users',
      {'page': page, 'per_page': perPage},
    );
    final apiResult = await http.get(url);
    final jsonObject = convert.jsonDecode(apiResult.body);
    List<dynamic> listResult = (jsonObject as Map<String, dynamic>)['data'];

    List<GetListResult> listUser = [];
    for (var i = 0; i < listResult.length; i++) {
      listUser.add(GetListResult.createGetListResult(listResult[i]));
    }

    return listUser;
  }
}
