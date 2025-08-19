import 'package:get/get.dart';
import 'pages/home_page.dart';
import 'pages/details_page.dart';

class AppRoutes {
  static const home = '/';
  static const details = '/details';

  static final pages = <GetPage>[
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: details, page: () => const DetailsPage()),
  ];
}
