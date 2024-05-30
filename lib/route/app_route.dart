import 'package:get/get.dart';
import '../view/image_detail_page.dart';
import '../view/home_page.dart';

class AppRoute {
  static final routes = [
    GetPage(name: '/', page: () => const HomePage()),
    GetPage(name: '/image_detail', page: () => const ImageDetailPage()),
  ];
}
