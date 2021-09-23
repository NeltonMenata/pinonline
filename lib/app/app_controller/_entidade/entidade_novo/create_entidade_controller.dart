import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:pinonline/app/app_views/_entidade/entidade_login_view.dart';
import 'package:pinonline/app/app_views/app_routes/routes.dart';

class CreateEntidadeController extends GetxController {
  static final controller = Get.put(CreateEntidadeController());

  var form = GlobalKey<FormState>();
  var nome = TextEditingController();
  var senha = TextEditingController();
  var email = TextEditingController();
  var categoria = TextEditingController();
  var mostraSenha = false;

  var telefone = TextEditingController();
  var morada = TextEditingController();
  var cidade = TextEditingController();
  var desc = TextEditingController();
  var formRegisto = GlobalKey<FormState>();

  toggleMostraSenha() {
    this.mostraSenha = !this.mostraSenha;
    update();
  }

  var isSave = false.obs;

  File? image;
  bool imageSelected = false;
  var _imagePicker = ImagePicker();
  Future<void> getImage() async {
    final file = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (file == null) return;
    image = File(file.path);
    imageSelected = true;
    update();
  }

  Future<void> saveEntidade(BuildContext context) async {
    if (formRegisto.currentState!.validate()) {
      try {
        isSave.value = true;
        final entidadeNovo = ParseObject("Entidade");
        final queryEntidade = QueryBuilder(entidadeNovo);
        queryEntidade.whereEqualTo("email", controller.email.text);
        final response = await queryEntidade.query();
        if (response.result != null) {
          Get.snackbar("Conta Nova", "Usuário já existe, faça o login!");
        } else {
          entidadeNovo
            ..set("nome", controller.nome.text.toString())
            ..set("morada", controller.morada.text.toString())
            ..set("cidade", controller.cidade.toString())
            ..set("contacto", controller.telefone.text.toString())
            ..set("categoria", controller.categoria.text.toString())
            ..set("email", controller.email.text.toString())
            ..set("descricao", controller.desc.text.toString())
            ..set("senha", controller.senha.text.toString());
          print("########### Nome salvos ##############");
          ParseFileBase parseFile;
          parseFile = ParseFile(image);
          await parseFile.save();
          print("########### Imagens Salvas ##############");
          entidadeNovo.set("img", parseFile);
          print("########### Entidade e Imagens Salvas ##############");
          await entidadeNovo.save();
          print("########### Entidade ####### Imagens Salvas ##############");
          isSave.value = false;
          await showDialog(
              context: context,
              builder: (context) {
                mostraSenha = false;

                return AlertDialog(
                  title: Text("JustBuild"),
                  content: Text("Profissional salvo com sucesso!"),
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

          controller.nome.text = "";
          controller.morada.text = "";
          controller.telefone.text = "";
          controller.email.text = "";
          controller.desc.text = "";
          controller.cidade.text = "";
          controller.senha.text = "";

          Get.offAll(EntidadeLoginView());
        }
      } catch (error) {
        Get.snackbar("Erro",
            "Usuário Profissional não salvo: $error \nVerifique a sua conexão com a internet");
      }
    }
  }

  void saveEntidadeName() {
    if (imageSelected == false) {
      Get.snackbar("Perfil", "Selecione uma imagem de perfil");
    }
    if (form.currentState!.validate() && imageSelected) {
      Get.toNamed(
        Routes.REGISTOENTIDADE,
      );
    }
  }
}
