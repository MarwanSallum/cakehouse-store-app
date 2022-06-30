class Router{

  // auth routers
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String forgotPassword = '/auth/forgot-password';
  static const String resetPassword = '/auth/reset-password';

  // disconnected internet router
  static const String disconnected = '/no_internet_access';

  // home routers
  static const String home = '/';
  static const String profile = '/home/profile';
  static const String store = '/home/store';
  static const String orders = '/home/orders';
  static const String favorites = '/home/favorites';

  // profile routers
  static const String accountManage = '/profile/account_manage';
  static const String contactUs = '/profile/contact-us';
  static const String termsAndConditions = '/profile/terms_and_conditions';
  static const String wallet = 'profile/wallet';

  // store routers
  static const String productDetail = '/store/product-detail';
  static const String selectLocation = '/store/select-location';

  // store categories routers
  static const String partyCategory = '/store/categories/party';
  static const String graduationCategory = '/store/categories/graduation';
  static const String weddingCategory = '/store/categories/wedding';
  static const String customCategory = '/store/categories/custom';

  // orders routers
  static const String orderDetail = '/order/order-detail';



}