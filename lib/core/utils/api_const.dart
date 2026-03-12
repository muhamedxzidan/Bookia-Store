class ApiConst {
  ApiConst._();

  static const String baseUrl = 'https://codingarabic.online/api';

  // Auth endpoints
  static const String loginEndpoint = '/login';
  static const String registerEndpoint = '/register';

  // Home endpoints
  static const String slidersEndPoint = '/sliders';
  static const String bestSellersEndPoint = '/products-bestseller';

  // Wishlist endpoints
  static const String showWishlistEndpoint = '/wishlist';
  static const String addToWishlistEndpoint = '/add-to-wishlist';
  static const String removeFromWishlistEndpoint = '/remove-from-wishlist';
}
