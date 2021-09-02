import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_controller/_cliente/cliente_login_controller.dart';
import 'package:pinonline/app/app_views/_size/size.dart';
import 'package:pinonline/app/app_views/_welcome/welcome_alternative_view.dart';

// ignore: must_be_immutable
class ClienteLoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = ClienteLoginController.controller;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10),
                color: Colors.blue[100],
                width: double.infinity,
                height: alturaPor(30, context),
                child: Column(children: [
                  CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      radius: larguraPor(
                          15, context), //_alturaTotal < 600 ? 50 : 65,
                      child: Image.asset("assets/img/logo.png")),
                  SizedBox(height: alturaPor(100, context) < 600 ? 15 : 20),
                  Text(
                    "Bem-Vindo a JustBuild",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: alturaPor(100, context) < 600 ? 20 : 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Escolhe uma das opções para o seu devido tratamento!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: alturaPor(100, context) < 600 ? 12 : 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 15,
                    left: 10,
                    right: 10,
                  ),
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Form(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Email",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextFormField(
                            controller: controller.email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: 'Email',
                                border: OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text("Senha",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          TextFormField(
                            controller: controller.senha,
                            obscuringCharacter: "*",
                            obscureText: true,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.panorama_fish_eye_rounded),
                                  onPressed: () {},
                                ),
                                hintText: 'Senha',
                                border: OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.green)),
                                child: Text("Entrar"),
                                onPressed: controller.startLogin),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.grey)),
                                onPressed: () {},
                                child: Text("Recuperar Senha")),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            //alignment: Alignment.center,
                            width: larguraPor(70, context),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.settings),
                                  onPressed: () {},
                                ),
                                Spacer(),
                                Text("Login with Google",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                        fontSize: 18))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            //alignment: Alignment.center,
                            width: larguraPor(70, context),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.settings),
                                  onPressed: () {},
                                ),
                                Spacer(),
                                Text("Login with Facebook",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                        fontSize: 18))
                              ],
                            ),
                          ),
            
                          TextButton(child: Text("Voltar"), onPressed:(){Get.offAll(WelcomeAlternativeView());}),
                        ],
                      ),
                    ),
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

/*

Container(
                  color: Colors.transparent,
                  height: alturaPor(50, context),
                  child: SingleChildScrollView(
                    child: Form(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Email",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: 'Email',
                                border: OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text("Senha",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          TextFormField(
                            obscuringCharacter: "*",
                            obscureText: _mostraSenha,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.panorama_fish_eye_rounded),
                                  onPressed: () {
                                  },
                                ),
                                hintText: 'Senha',
                                border: OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.green)),
                                onPressed: () {
                                  
                                },
                                child: Text("Entrar")),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.grey)),
                                onPressed: () {},
                                child: Text("Recuperar Senha")),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            //alignment: Alignment.center,
                            width: larguraPor(70, context),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.settings),
                                  onPressed: () {},
                                ),
                                Spacer(),
                                Text("Login with Google",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                        fontSize: 18))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            //alignment: Alignment.center,
                            width: larguraPor(70, context),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.settings),
                                  onPressed: () {},
                                ),
                                Spacer(),
                                Text("Login with Facebook",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                        fontSize: 18))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

*/