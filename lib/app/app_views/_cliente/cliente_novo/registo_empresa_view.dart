import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_controller/_cliente/cliente_novo/create_user_controller.dart';
import 'package:pinonline/app/app_models/cliente_model.dart';
import 'package:pinonline/app/app_provider/provider_data.dart';
import 'package:pinonline/app/app_views/_cliente/cliente_login_view.dart';

// ignore: must_be_immutable
class RegistoEmpresaView extends StatelessWidget {
  
  Widget build(BuildContext context) {
    //final larguraTotal = MediaQuery.of(context).size.width;
    final alturaTotal = MediaQuery.of(context).size.height;
    //final controller = Get.put(AnimationController(largura: largura * 0.9, altura: altura * 0.8));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: ListTile(
            title: Text("Dados da Empresa"),
            subtitle: Text("Insira os Dados de sua entidade")),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 20, left: 25, right: 25),
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.white),
          child: ListView(
            children: [
              Container(
                color: Colors.transparent,
                height: (alturaTotal * 0.85),
                child: Form(
                  key: CreateUserController.controller.formRegisto,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Telefone",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: CreateUserController.controller.telefone,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            hintText: 'Telefone',
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Morada",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: CreateUserController.controller.morada,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: 'Morada', border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Cidade",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextFormField(
                        controller: CreateUserController.controller.cidade,
                        decoration: InputDecoration(
                            hintText: 'Cidade', border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Descrição",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextFormField(
                        controller: CreateUserController.controller.desc,
                        decoration: InputDecoration(
                            hintText: 'Descrição',
                            border: OutlineInputBorder()),
                      ),
                      Spacer(),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green)),
                          onPressed: ()async {
                            if (CreateUserController.controller.formRegisto.currentState!.validate()) {
                              
                              ProviderData.clienteLista.add(ClienteModel(
                                nome: CreateUserController.controller.nome.text,
                                email: CreateUserController.controller.email.text,
                                senha: CreateUserController.controller.senha.text,
                                desc: CreateUserController.controller.desc.text,
                                contacto: CreateUserController.controller.telefone.text,
                                morada: CreateUserController.controller.morada.text,
                                objectId: "objectId",
                                img: "Imagem Perfil"
                              ));

                              await showDialog(context: context, builder: (context){
                                return AlertDialog(
                                  title: Text("JustBuild"),
                                  content: Text("Sucess Save User"),
                                  actions: [TextButton(onPressed: (){Navigator.pop(context);}, child: Text("OK"))],
                                );
                              });
                            }
                            
                            Get.offAll(ClienteLoginView());
                          },
                          child: Text("Salvar Entidade")),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.grey)),
                          onPressed: () {
                            Get.back();
                          },
                          child: Text("Ignorar"))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimationController extends GetxController {
  AnimationController({required this.largura, required this.altura});
  var largura = 0.0;
  var altura = 0.0;
  bool troca = false;
  List<Color> cores = [
    Colors.orange,
    Colors.red,
    Colors.blue,
    Colors.black,
    Colors.yellow,
    Colors.pink,
    Colors.brown,
    Colors.grey,
  ];
  onTap() {
    if (troca) {
      largura += 15;
      altura += 15;

      update();
    } else {
      largura -= 15;
      altura -= 15;

      update();
    }
    troca = !troca;
    Future.delayed(Duration(seconds: 2), () {
      onTap();
    });
  }

  onDoubleTap() {
    if (troca == true) {
      largura -= 10;
      altura -= 10;
      update();
    }
    troca = false;
  }
}
