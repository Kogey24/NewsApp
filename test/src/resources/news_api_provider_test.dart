import 'package:hacker_news_app/src/resources/news_api_provider.dart';
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  test('FetchTopIds returns a list of ids', () async {
    //Setup
    final newsApi = NewsApiProvider();
    newsApi.client = MockClient((request) async {
      return Response(json.encode([1, 2, 3, 4, 5]), 200);
    });

    final ids = await newsApi.fetchTopIds();

    //expectation
    expect(ids, [1, 2, 3, 4, 5]);
  });

  test('FetchItem returns a item model', () async {
    final newsApi = NewsApiProvider();
    newsApi.client = MockClient((request) async {
      final jsonMap = {'id': 123};
      return Response(jsonEncode(jsonMap), 200);
    });

    final item = await newsApi.fetchItems(123);
    expect(item.id, 123);
  });
}
