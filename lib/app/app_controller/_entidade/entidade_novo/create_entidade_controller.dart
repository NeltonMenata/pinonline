import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pinonline/app/app_models/entidade_model.dart';
import 'package:pinonline/app/app_provider/provider_data.dart';
import 'package:pinonline/app/app_views/_entidade/entidade_login_view.dart';
import 'package:pinonline/app/app_views/app_routes/routes.dart';

class CreateEntidadeController extends GetxController {
  static final controller = Get.put(CreateEntidadeController());

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

  Future<void> saveEntidade(BuildContext context) async {
    if (formRegisto.currentState!.validate()) {
      ProviderData.entidadeLista.add(EntidadeModel(
          nome: CreateEntidadeController.controller.nome.text,
          email: CreateEntidadeController.controller.email.text,
          senha: CreateEntidadeController.controller.senha.text,
          desc: CreateEntidadeController.controller.desc.text,
          contacto: CreateEntidadeController.controller.telefone.text,
          morada: CreateEntidadeController.controller.morada.text,
          objectId: "objectId",
          categoria: "Categoria",
          img: "Imagem Perfil"));

      await showDialog(
          context: context,
          builder: (context) {
            
            imageSelected = false;

            return AlertDialog(
              title: Text("JustBuild"),
              content: Text("Sucess Save Entidade"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("OK"))
              ],
            );
          });
    }

    Get.offAll(EntidadeLoginView());
  }

  void saveEntidadeName() {
    if(imageSelected == false){
      Get.snackbar("Perfil", "Selecione uma imagem de perfil");
    }
    if (form.currentState!.validate() && imageSelected) {
      Get.toNamed(
        Routes.REGISTOENTIDADE,
      );
    }
  }
}
