import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class PostResult {
  String id, name, job, created;

  PostResult({
    required this.id,
    required this.name,
    required this.job,
    required this.created,
  });

  factory PostResult.createPostResult(Map<String, dynamic> object) {
    return PostResult(
      id: object['id'],
      name: object['name'],
      job: object['job'],
      created: object['createdAt'],
    );
  }

  static Future<PostResult> postToAPI(String name, String job) async {
    final url = Uri.https('reqres.in', '/api/users');
    final apiResult = await http.post(
      url,
      body: {
        'name': name,
        'job': job,
      },
    );
    final jsonObject = convert.jsonDecode(apiResult.body);

    return PostResult.createPostResult(jsonObject);
  }
}
