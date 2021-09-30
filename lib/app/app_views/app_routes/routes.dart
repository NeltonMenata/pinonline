import 'package:get/get.dart';
import 'package:pinonline/app/app_views/_entidade/entidade_novo/create_entidade_view.dart';
import 'package:pinonline/app/app_views/_entidade/entidade_novo/registo_entidade_view.dart';
import 'package:pinonline/app/app_views/_welcome/welcome_alternative_view.dart';
import 'package:pinonline/app/app_views/actividade_view.dart';
import 'package:pinonline/app/app_views/_cliente/cliente_novo/create_user_view.dart';
import 'package:pinonline/app/app_views/descartados_views/delete_categorie_view.dart';
import 'package:pinonline/app/app_views/descartados_views/entidade_categoria_view.dart';
import 'package:pinonline/app/app_views/descartados_views/entidade_perfil_view.dart';
import 'package:pinonline/app/app_views/descartados_views/home_view.dart';
import 'package:pinonline/app/app_views/descartados_views/login_view.dart';
import 'package:pinonline/app/app_views/descartados_views/save_categories_view.dart';
import 'package:pinonline/app/app_views/descartados_views/search_view.dart';
import 'package:pinonline/app/app_views/descartados_views/welcome_view.dart';
import 'package:pinonline/app/app_views/_orcamento/orcamento_view.dart';
import 'package:pinonline/app/app_views/_cliente/cliente_novo/registo_user_view.dart';
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
    GetPage(name: CREATEENTIDADE, page: () => CreateEntidadeView()),
    GetPage(name: ACTIVIDADE, page: () => ActivityView()),
    GetPage(name: REGISTOUSER, page: () => RegistoUserView()),
    GetPage(name: REGISTOENTIDADE, page: () => RegistoEntidadeView()),
    GetPage(name: WELCOME, page: () => WelcomeView()),
    GetPage(name: LOGIN, page: () => LoginView()),
    GetPage(name: ORCAMENTO, page: () => OrcamentoView()),

    // ROTAS DA APP ALTERNATIVA

    GetPage(name: WELCOME_, page: () => WelcomeAlternativeView()),
  ];

  static const STARTAPP = "/";
  static const HOME = "/home";
  static const SEARCH = "/search";
  static const SAVE = "/save";
  static const DELETE = "/delete";
  static const ENTIDADECATEGORIA = "/entidadecategoria";
  static const ENTIDADEPERFIL = "/entidadeperfil";
  static const CREATEUSER = "/createuser";
  static const CREATEENTIDADE = "/createentidade";
  static const ACTIVIDADE = "/actividade";
  static const REGISTOUSER = "/registouser";
  static const REGISTOENTIDADE = "/registoentidade";
  static const WELCOME = "/welcome";
  static const LOGIN = "/login";
  static const ORCAMENTO = "/orcamento";

  // VARIAVEIRS DE ROTAS DA APP ALTERNATIVE

  static const WELCOME_ = "/welcome_";
}
