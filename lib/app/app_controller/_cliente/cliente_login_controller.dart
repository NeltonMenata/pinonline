import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pinonline/app/app_models/cliente_model.dart';
import 'package:pinonline/app/app_provider/provider_data.dart';
import 'package:pinonline/app/app_views/_cliente/cliente_welcome_view.dart';

class ClienteLoginController extends GetxController {
  static final controller = Get.put(ClienteLoginController());

// Variaveis que pegam o email e a senha no momento do login!
  var email = TextEditingController();
  var senha = TextEditingController();

// Lista com a finalidade de retorna apenas 1 usuário!
  final List<ClienteModel> cliente = [];

// Função que procura o usuário no sistema
// e retorna String "1" se encontra e String "0"
// se não encontra o usuário
  String clienteLogin(String _email, String _senha) {
    var clienteLista = ProviderData.clienteLista;

    clienteLista.forEach((element) {
      if (element.email == _email && element.senha == _senha) {
        cliente.clear();
        cliente.add(element);
      }
    });

    return cliente.length == 1 ? "1" : "0";
  }

// Função que faz login do Usuário e chama a Tela
// de Bem-Vindo se o usuário for encontrado no sistema!
  void startLogin() {
    if (controller.clienteLogin(email.text, senha.text) == "1") {
      Get.to(ClienteWelcomeView());
      email.text = "";
      senha.text = "";

    } else {
      email.text = "";
      senha.text = "";
    }
  }

  //Função que limpa o login feito
void clearLogin(){
  cliente.clear();
}
}
