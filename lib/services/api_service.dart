import 'dart:convert';

import 'package:http/http.dart';
import 'package:webpage/models/article_model.dart';
import 'api_key.dart';

class APIService {
  Future<TopStories> getTopStories(String section) async {
    var finalUrL =
        "https://api.nytimes.com/svc/topstories/v2/$section.json?api-key=${APIKey.key}";
    Response response = await get(Uri.encodeFull(finalUrL));
    print('URL : $finalUrL');
    if (response.statusCode == 200) {
      return TopStories.fromJson(json.decode(response.body));
    } else {
      throw Exception("Cannot fetch data");
    }
  }
}
