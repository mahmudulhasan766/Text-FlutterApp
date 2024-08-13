import 'package:test_app/core/app/app_flavor.dart';

class ApiUrls {
  static String baseUrl = getServerUrl();
  static const String liveUrl = 'https://demo.limerickbd.com/backend/public/api'; //live server
  static const String devUrl = 'https://demo.limerickbd.com/backend/public/api'; // dev server
  static const String testUrl = 'https://demo.limerickbd.com/backend/public/api'; // test server

  static String getServerUrl() {
    if (AppFlavor.getFlavor == FlavorStatus.production) {
      return liveUrl;
    } else if (AppFlavor.getFlavor == FlavorStatus.development) {
      return devUrl;
    } else if (AppFlavor.getFlavor == FlavorStatus.staging) {
      return testUrl;
    } else {
      return liveUrl;
    }
  }
  // shop module
  static const String login = '/login';
  static const String logout = '/logout';
  static const String products = '/fg-with-stock';

}
