import 'dart:convert';
import 'package:hacker_news_app/src/models/item_model.dart';
import 'package:hacker_news_app/src/resources/repository.dart';
import 'package:http/http.dart' show Client, Response;
import 'dart:async';

final _root = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider implements Source {
  Client client = Client();

  Future<List<int>> fetchTopIds() async {
    final response = await client.get(
      Uri.parse("$_root/topstories.json?print=pretty"),
    );
    final ids = json.decode(response.body);

    return ids.cast<int>();
  }

  Future<ItemModel> fetchItem(int id) async {
    final response = await client.get(
      Uri.parse('$_root/item/$id.json?print=pretty'),
    );
    final parsedJson = json.decode(response.body);

    return ItemModel.fromJson(parsedJson);
  }
}
