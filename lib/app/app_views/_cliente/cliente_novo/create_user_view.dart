import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_controller/_cliente/cliente_novo/create_user_controller.dart';
import 'package:pinonline/app/app_function_global/function_global.dart';
import 'package:pinonline/app/app_views/app_routes/routes.dart';

class CreateUserView extends StatefulWidget {
  @override
  _CreateUserViewState createState() => _CreateUserViewState();
}

class _CreateUserViewState extends State<CreateUserView> {
  Widget build(BuildContext context) {
    //final larguraTotal = MediaQuery.of(context).size.width;
    final alturaTotal = MediaQuery.of(context).size.height;
    //final controller = Get.put(AnimationController(largura: largura * 0.9, altura: altura * 0.8));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: ListTile(
            title: Text("Criar Registo"),
            subtitle: Text("Insira os seus Dados")),
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
                height: (alturaTotal * 0.4) - (alturaTotal * 0.08),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(70)),
                      child: GestureDetector(
                        onTap: () {
                          CreateUserController.controller.getImage();
                        },
                        child: GetBuilder<CreateUserController>(
                          init: CreateUserController(),
                          builder: (_) => CircleAvatar(
                              radius: 60,

                              // ignore: unnecessary_null_comparison
                              child: CreateUserController
                                      .controller.imageSelected
                                  ? ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(100)),
                                    child: Image.file(
                                        CreateUserController.controller.image!,width: double.infinity,height: double.infinity,),
                                  )
                                  : Center(
                                      child: Text(
                                        "Selecione a Imagem",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    )),
                        ),
                      ),
                    ),
                    Text(
                      "Conta de Usuário",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.transparent,
                height: (alturaTotal * 0.6) - (alturaTotal * 0.08),
                child: Form(
                  key: CreateUserController.controller.form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Nome de Usuário",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: CreateUserController.controller.nome,
                        keyboardType: TextInputType.name,
                        validator: (v) {
                          if (v == "" || v == null) {
                            return "Preencha o campo com o seu nome";
                          } else if (v.length <= 3) {
                            return "Nome muito curto";
                          }
                        },
                        decoration: InputDecoration(
                            hintText: 'Nome de Usuario',
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Email",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: CreateUserController.controller.email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: 'Email', border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Senha",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextFormField(
                        controller: CreateUserController.controller.senha,
                        obscuringCharacter: "*",
                        obscureText:
                            CreateUserController.controller.mostraSenha,
                        validator: (v) {
                          if (!containLetter(v)) {
                            return "Senha deve conter letra!";
                          } else if (!containNumber(v)) {
                            return "Senha deve conter número!";
                          } else if (v!.length <= 5) {
                            return "Senha não pode ter menos de 5 caracteres";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Senha',
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.panorama_fish_eye_outlined),
                            onPressed: CreateUserController
                                .controller.toggleMostraSenha,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green)),
                          onPressed: () {
                            if (CreateUserController
                                .controller.form.currentState!
                                .validate()) {
                              Get.toNamed(
                                Routes.REGISTOEMPRESA,
                              );
                            }
                          },
                          child: Text("Salvar Usuário"))
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
