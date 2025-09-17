import 'package:http/http.dart' as http;

class ApiService {
  ApiService._privateConstructor();
  static final ApiService instance = ApiService._privateConstructor();
  factory ApiService(){
    return instance;
  }
  Map<String, dynamic> _getHeader() {
    return {
      "Content-Type" : "application/json"
    };
  }
  final _client = http.Client();
  Future<http.Response> get(String url) {
    return _client.get(Uri.parse(url));
  }
  
  Future<http.Response> post(String url, body) {
    return _client.post(Uri.parse(url), body: body);
  }

  Future<http.Response> delete(String url) {
    return _client.delete(Uri.parse(url));
  }
}