import 'package:http/http.dart' as http;

class WeatherApiService {
  WeatherApiService._privateConstructor();

  static final WeatherApiService instance = WeatherApiService._privateConstructor();

  factory WeatherApiService() {
    return instance;
  }

  final _client = http.Client();

  Future<http.Response> get(String url) {
    return _client.get(Uri.parse(url));
  }
}
