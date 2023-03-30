import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ListArticlesModel {
  String id, title, body;
  ListArticlesModel(
      {required this.id, required this.title, required this.body});

  factory ListArticlesModel.createList(Map<String, dynamic> object) {
    return ListArticlesModel(
      id: object["id"].toString(),
      title: object["title"].toString(),
      body: object["body"].toString(),
    );
  }

  static Future<List<ListArticlesModel>> getListFromApi(
      String start, String limit) async {
    final url = Uri.https(
      'jsonplaceholder.typicode.com',
      '/posts',
      {
        '_start': start,
        '_limit': limit,
      },
    );
    final apiResult = await http.get(url);
    final jsonObject = convert.jsonDecode(apiResult.body) as List;
    return jsonObject
        .map<ListArticlesModel>(
          (item) => ListArticlesModel.createList(item),
        )
        .toList();
  }
}
