import 'package:get/get.dart';
import 'package:pinonline/app/app_views/actividade_view.dart';
import 'package:pinonline/app/app_views/create_user_view.dart';
import 'package:pinonline/app/app_views/login_view.dart';
import 'package:pinonline/app/app_views/registo_empresa_view.dart';
import '../welcome_view.dart';
import '/app/app_views/entidade_categoria_view.dart';
import '/app/app_views/entidade_perfil_view.dart';
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
    GetPage(name: ENTIDADECATEGORIA, page: () => EntidadeCategoriaView()),
    GetPage(name: ENTIDADEPERFIL, page: () => EntidadePerfilView()),
    GetPage(name: CREATEUSER, page: () => CreateUserView()),
    GetPage(name: ACTIVIDADE, page: () => ActivityView()),
    GetPage(name: REGISTOEMPRESA, page: () => RegistoEmpresaView()),
    GetPage(name: WELCOME, page: () => WelcomeView()),
    GetPage(name: LOGIN, page: () => LoginView()),
  ];
  
  static const STARTAPP = "/";
  static const HOME = "/home";
  static const SEARCH = "/search";
  static const SAVE = "/save";
  static const DELETE = "/delete";
  static const ENTIDADECATEGORIA = "/entidadecategoria";
  static const ENTIDADEPERFIL = "/entidadeperfil";
  static const CREATEUSER = "/createuser";
  static const ACTIVIDADE = "/actividade";
  static const REGISTOEMPRESA = "/registoempresa";
  static const WELCOME = "/welcome";
  static const LOGIN = "/login";
  

}
