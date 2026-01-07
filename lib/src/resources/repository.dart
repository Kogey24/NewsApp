import 'dart:async';
import 'news_api_provider.dart';
import 'news_db_provider.dart';
import '../models/item_model.dart';

class Repository {
  final newsApiProvider = NewsApiProvider();
  final newsDbProvider = NewsDbProvider();

  Future<List<int>> fetchTopIds() {
    return newsApiProvider.fetchTopIds();
  }

  Future<ItemModel> fetchItem(int id) async {
    // Try to get the item from the database
    final item = await newsDbProvider.fetchItem(id);
    if (item != null) {
      return item;
    }

    // If not found in the database, fetch from the API
    final apiItem = await newsApiProvider.fetchItems(id);
    // Save the fetched item to the database
    newsDbProvider.addItem(apiItem);
    return apiItem;
  }
}
