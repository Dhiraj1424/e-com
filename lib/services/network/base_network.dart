abstract class BaseApiService {
  Future<dynamic> getAll(String url);
  Future<dynamic> getProductById(String url);
  Future<dynamic> postAll(String url, dynamic data);
  Future<dynamic> login(String url, dynamic data);
  Future<dynamic> addCart(String url, dynamic data);
  Future<dynamic> getAllCarts(String url);
  Future<dynamic> getCartsBYCartId(String url);

  Future<dynamic> getUserCart(String url);
  Future<dynamic> getUserCartByDate(String url);
  Future<dynamic> getUserCartByUserId(String url);
  Future<dynamic> addDataIntoCard(dynamic data, String url);

  // update Cart
  Future<dynamic> updateCart(String url,dynamic data);

// Future<dynamic> register(String url, dynamic data);
}
