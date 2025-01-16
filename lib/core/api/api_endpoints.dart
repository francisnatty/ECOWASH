class ApiEndpoints {
  static const String login = 'res-auth/login';
  static const String signup = 'res-auth/signup';
  static const String verifyEmail = 'res-auth/email-verification';
  static const String resendEmailOtp = 'res-auth/email-verification/resend';
  static const String emailresetpasswordrequest =
      'res-auth/email-request-password-reset';
  static const String verifypasswordresetemail =
      'res-auth/email-verify-password-reset';

  static const String resetpassword = 'res-auth/password-reset';

  static const String kyc = 'res-profile/kyc';
  static const String fileUpload =
      'https://foodlify-ad7d655e112e.herokuapp.com/api/v2/upload/multiple';

  static const String storeProfileSetup = 'res-profile/setup';

  //notification
  static const String subscribeNotification = 'res-extra/push/subscribe';
  static const String linkDevice = 'res-extra/push/link-user';
  static const String unLinkDevice = 'res-extra/push/unlink-user';

  //products
  static const String getCollections = 'user-products/collections';
  static const String getCategories = 'user-products/categories';
  static const String createProduct = 'res-products/create';
  static const String createCategory = 'res-products/category/create';
  static const String foodlifyGallery = 'res-products/gallary';
  static const String getOptions = 'res-products/options';
  static const String createOptions = 'res-products/options/create';

  static const String getProducts = 'res-products/list';
  static const String getProductDetails = 'res-products';

  static const String editProduct = 'res-products/edit';

  //users
  static const String inviteUser = 'res-profile/users/invite';
  static const String getUsers = 'res-profile/users';
  static const String profile='res-profile';

  static const String getOrders = 'res-order/orders';
  static const String getOrderDetails = 'res-order/order';

  //extra

  //promotions
  static const String requestPromotion = 'res-extra/promotion/request';
  static const String getPromotionPlans = 'res-extra/promotion/plans';
  static const String getPromotions = 'res-extra/promotions';

  //points
  static const String getPointsBalance = 'res-extra/points/balance';
  static const String getPointsTransactionHistory = 'res-extra/points/history';

  //coupon
  static const String createCoupon = 'res-extra/coupon/create';
  static const String getCouponDetails = 'res-extra/coupon';
  static const String listCoupons = '/res-extra/coupons';

  //wallet
  static const String getTransactions = 'res-wallet/transactions';
  static const String getWallet = 'res-wallet';
  static const String payOnline = 'res-wallet/fund/pay-online';
  static const String savedAccounts = 'res-wallet/saved-accounts';
  static const String saveAccount = 'res-wallet/save-account';
  static const String verifyBank = 'res-wallet/check-account';
  static const String listBanks = 'res-wallet/list-banks';
}
