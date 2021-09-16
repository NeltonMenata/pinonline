import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_models/cliente_model.dart';
import 'package:pinonline/app/app_models/user_new_model.dart';
import 'package:pinonline/app/app_provider/provider_data.dart';
import 'package:pinonline/app/app_views/_cliente/cliente_login_view.dart';

// ignore: must_be_immutable
class RegistoEmpresaView extends StatelessWidget {
  
  var _telefone = TextEditingController();
  var _morada = TextEditingController();
  var _cidade = TextEditingController();
  var _desc = TextEditingController();
  var _form = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    final UserNew userNew = Get.arguments;
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
                  key: _form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Telefone",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: _telefone,
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
                        controller: _morada,
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
                        controller: _cidade,
                        decoration: InputDecoration(
                            hintText: 'Cidade', border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Descrição",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextFormField(
                        controller: _desc,
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
                            if (_form.currentState!.validate()) {
                              final UserNewFull userNewFull = UserNewFull(
                                  userNew,
                                  telefone: _telefone.text,
                                  morada: _morada.text,
                                  cidade: _cidade.text,
                                  desc: _desc.text);

                              ProviderData.clienteLista.add(ClienteModel(
                                nome: userNewFull.userNew.nome,
                                email: userNewFull.userNew.email,
                                senha: userNewFull.userNew.senha,
                                desc: userNewFull.desc,
                                contacto: userNewFull.telefone,
                                morada: userNewFull.morada,
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
