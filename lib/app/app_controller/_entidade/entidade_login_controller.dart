import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:pinonline/app/app_models/entidade_model.dart';
import 'package:pinonline/app/app_views/_entidade/entidade_welcome_view.dart';

class EntidadeLoginController extends GetxController {
  static final controller = Get.put(EntidadeLoginController());

// Variaveis que pegam o email e a senha no momento do login!
  var email = TextEditingController();
  var senha = TextEditingController();
  var mostraSenha = false;
// Lista com a finalidade de retorna apenas 1 usuário!
  final List<EntidadeModel> entidade = [];

// Função que procura o usuário no sistema
// e retorna String "1" se encontra e String "0"
// se não encontra o usuário
  Future<String> entidadeLogin(String _email, String _senha) async {
    final entidadeLogin = ParseObject("Entidade");
    final query = QueryBuilder(entidadeLogin);
    query
    ..whereEqualTo("email", _email)
    ..whereEqualTo("senha", _senha);
    final response = await query.query();
    if (response.success && response.result != null) {
      entidade.add(EntidadeModel(
        nome: response.result[0]["nome"].toString(),
        email: response.result[0]["email"].toString(),
        contacto: response.result[0]["contacto"].toString(),
        categoria: response.result[0]["categoria"].toString(),
        desc: response.result[0]["descricao"].toString(),
        morada: response.result[0]["morada"].toString(),
        img: response.result[0]["img"]["url"].toString(),
        admin: response.result[0]["admin"],
        senha: response.result[0]["senha"].toString(),
        objectId: response.result[0]["objectId"].toString(),
      ));
    }
    return entidade.length == 1 ? "1" : "0";
  }
  
 //Troca a visualização do campo de senha
  toggleMostraSenha() {
    this.mostraSenha = !this.mostraSenha;
    update();
  }

// Função que faz login do Usuário e chama a Tela
// de Bem-Vindo se o usuário for encontrado no sistema!
  void startLogin() async {
    if ("1" == await controller.entidadeLogin(email.text.toLowerCase(), senha.text)) {
      Get.to(EntidadeWelcomeView());
      email.text = "";
      senha.text = "";
    } else {
      email.text = "";
      senha.text = "";
    }
  }

  //Função que limpa o login feito
  void clearLogin() {
    entidade.clear();
  }
}
