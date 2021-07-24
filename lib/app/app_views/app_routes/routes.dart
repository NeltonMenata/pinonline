import 'package:get/get.dart';
import '../delete_categorie_view.dart';
import '../save_categories_view.dart';
import '../search_view.dart';
import '../home_view.dart';
import '../splash_screen.dart';

class Routes {
  static var routes = [
    GetPage(name: STARTAPP, page: () => SplashScreenPage()),
    GetPage(name: HOME, page: () => HomeView()),
    GetPage(name: SEARCH, page: () => SearchView()),
    GetPage(name: SAVE, page: () => SaveCategorieView()),
    GetPage(name: DELETE, page: () => DeleteCategorieView()),
  ];
  static const STARTAPP = "/";
  static const HOME = "/home";
  static const SEARCH = "/search";
  static const SAVE = "/save";
  static const DELETE = "/delete";
}
