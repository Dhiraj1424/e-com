abstract class BaseApiService{
Future<dynamic> getAll(String url);
Future<dynamic> getProductById(String url);
Future<dynamic> postAll(String url,dynamic data);
Future<dynamic> login(String url,dynamic data);
// Future<dynamic> register(String url, dynamic data);
}