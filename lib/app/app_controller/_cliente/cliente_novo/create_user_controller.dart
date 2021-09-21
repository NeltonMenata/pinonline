import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:pinonline/app/app_models/cliente_model.dart';
import 'package:pinonline/app/app_provider/provider_data.dart';
import 'package:pinonline/app/app_views/_cliente/cliente_login_view.dart';
import 'package:pinonline/app/app_views/app_routes/routes.dart';

class CreateUserController extends GetxController {
  static final controller = Get.put(CreateUserController());

  var form = GlobalKey<FormState>();
  var nome = TextEditingController();
  var senha = TextEditingController();
  var email = TextEditingController();
  var mostraSenha = false;

  var telefone = TextEditingController();
  var morada = TextEditingController();
  var cidade = TextEditingController();
  var desc = TextEditingController();
  var formRegisto = GlobalKey<FormState>();
  var isSave = false.obs;

  toggleMostraSenha() {
    this.mostraSenha = !this.mostraSenha;
    update();
  }

  File? image;
  bool imageSelected = false;
  var _imagePicker = ImagePicker();
  Future<void> getImage() async {
    final file = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (file == null) return;
    image = File(file.path);
    imageSelected = true;
    update();
    print("Imagem: " + this.image.toString());
  }

  Future<void> saveUser(BuildContext context) async {
    if (formRegisto.currentState!.validate()) {
      ProviderData.clienteLista.add(ClienteModel(
          nome: CreateUserController.controller.nome.text,
          email: CreateUserController.controller.email.text,
          senha: CreateUserController.controller.senha.text,
          desc: CreateUserController.controller.desc.text,
          contacto: CreateUserController.controller.telefone.text,
          morada: CreateUserController.controller.morada.text,
          objectId: "objectId",
          img: "Imagem Perfil"));

      try {
        isSave.value = true;
        final clienteNovo = ParseObject("Cliente");
        final queryCliente = QueryBuilder(clienteNovo);
        queryCliente.whereEqualTo(
            "email", CreateUserController.controller.email.text);
        final response = await queryCliente.query();
        if (response.result != null) {
          print(response.result);
          Get.snackbar("Conta Nova", "Usuário já existe, faça o login!");
        }else{
          clienteNovo
            ..set("nome", CreateUserController.controller.nome.text)
            ..set("morada",CreateUserController.controller.morada.text)
            ..set("contacto", CreateUserController.controller.telefone.text)
            ..set("email",CreateUserController.controller.email.text)
            ..set("descricao", CreateUserController.controller.desc.text)
            ..set("senha", CreateUserController.controller.senha.text);
            
        ParseFileBase parseFile;
        parseFile = ParseFile(image);
        await parseFile.save();
        clienteNovo.set("img", parseFile);
        await clienteNovo.save();
        isSave.value = false;
        await showDialog(
          context: context,
          builder: (context) {
            mostraSenha = false;

            return AlertDialog(
              title: Text("JustBuild"),
              content: Text("Usuário salvo com sucesso!"),
              actions: [
                TextButton(
                    onPressed: () {
                      imageSelected = false;
                      Navigator.pop(context);
                    },
                    child: Text("OK"))
              ],
            );
          });
          CreateUserController.controller.nome.text = "";
          CreateUserController.controller.morada.text = "";
          CreateUserController.controller.telefone.text = "";
          CreateUserController.controller.email.text = "";
          CreateUserController.controller.desc.text = "";
          CreateUserController.controller.cidade.text = "";
          CreateUserController.controller.senha.text = "";

          Get.offAll(ClienteLoginView());
        }
      } catch (error) {
        Get.snackbar("Erro", "Usuário não salvo: $error \nVerifique a sua conexão com a internet");
        
      }

      
    }

    
  }

  void saveUserName() {
    if (imageSelected == false) {
      Get.snackbar("Perfil", "Selecione uma imagem de perfil");
    }
    if (form.currentState!.validate() && imageSelected) {
      Get.toNamed(
        Routes.REGISTOUSER,
      );
    }
  }
}
