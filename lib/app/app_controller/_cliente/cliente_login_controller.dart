import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:pinonline/app/app_controller/_cliente/cliente_obra_nova_controller.dart';
import 'package:pinonline/app/app_models/cliente_model.dart';
import 'package:pinonline/app/app_views/_cliente/cliente_welcome_view.dart';

class ClienteLoginController extends GetxController {
  static final controller = Get.put(ClienteLoginController());

// Variaveis que pegam o email e a senha no momento do login!
  var email = TextEditingController();
  var senha = TextEditingController();
  var mostraSenha = false;

// Lista com a finalidade de retorna apenas 1 usuário!
  final List<ClienteModel> cliente = [];

// Função que procura o usuário no sistema
// e retorna String "1" se encontra e String "0"
// se não encontra o usuário
  Future<String> clienteLogin(String _email, String _senha) async {
    
    /*
    var clienteLista = ProviderData.clienteLista;

    clienteLista.forEach((element) {
      if (element.email == _email && element.senha == _senha) {
        cliente.clear();
        cliente.add(element);
      }
    });
    */

    final clienteLogin = ParseObject("Cliente");
    final query = QueryBuilder(clienteLogin);
    query..whereEqualTo("email", _email)..whereEqualTo("senha", _senha);
    final response = await query.query();
    if(response.success && response.result != null){
      cliente.add(
        ClienteModel(
          nome: response.result[0]["nome"],
          email: response.result[0]["email"],
          contacto: response.result[0]["contacto"],
          desc: response.result[0]["descricao"],
          morada: response.result[0]["morada"],
          img: response.result[0]["img"]["url"],
          senha: response.result[0]["senha"],
          objectId: response.results![0]["objectId"],
        )
      );
      print("Imprimindo resultado do Login: ${response.result[0]}");
    }
    return cliente.length == 1 ? "1" : "0";

    
  }

  //Troca a visualização do campo de senha
  toggleMostraSenha() {
    this.mostraSenha = !this.mostraSenha;
    update();
  }

// Função que faz login do Usuário e chama a Tela
// de Bem-Vindo se o usuário for encontrado no sistema!
  void startLogin() async {
    if ("1" == await controller.clienteLogin(email.text, senha.text)) {
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
  @override
  void onClose() {
    
    ClienteObraNovaController.controller.isDocSelect.value = false;
    super.onClose();
  }
}
