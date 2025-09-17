import 'package:http/http.dart' as http;

class NewsApiService {
  NewsApiService._privateConstructor();

  static final NewsApiService instance = NewsApiService._privateConstructor();

  factory NewsApiService() {
    return instance;
  }

  final _client = http.Client();

  Future<http.Response> get(String url) {
    return _client.get(Uri.parse(url));
  }
}
