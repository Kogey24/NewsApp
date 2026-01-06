import 'package:http/http.dart' show Client;

class NewsApiProvider {
  Client client = Client();

  fetchTopIds() {
    client.get(
      Uri.parse(
        "https://hacker-news.firebaseio.com/v0/item/8863.json?print=pretty",
      ),
    );
  }

  fetchItems() {}
}
