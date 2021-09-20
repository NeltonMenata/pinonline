import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_controller/_entidade/entidade_login_controller.dart';
import 'package:pinonline/app/app_views/_entidade/entidade_welcome_view.dart';
import 'package:pinonline/app/app_views/_size/size.dart';
import 'package:pinonline/app/app_views/_welcome/welcome_alternative_view.dart';

// ignore: must_be_immutable
class EntidadeLoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = EntidadeLoginController.controller;
    var _alturaTotal = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10),
                color: Colors.white70,
                width: double.infinity,
                height: alturaPor(30, context),
                child: Column(children: [
                  Container(
                      height: alturaPor(20, context),
                      child: Image.asset("assets/img/logo1.png")),
                  Spacer(),
                  Text(
                    "Seja bem-vindo a sua plataforma",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: _alturaTotal < 600 ? 16 : 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade800,
                        fontFamily: "Times New Roman"),
                  ),
                ]),
              ),
              Expanded(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 15,
                      left: 20,
                      right: 20,
                    ),
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Form(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "Email Address",
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
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
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
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.green)),
                                  child: Text("Iniciar Sessão"),
                                  onPressed: (){
                                      Get.to(EntidadeWelcomeView());
                                  }),
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.grey)),
                                  onPressed: () {},
                                  child: Text("Recuperar Senha")),
                            ),
                            TextButton(
                              onPressed: () {
                                //Get.toNamed(Routes.CREATEUSER);
                              },
                              child: Text("Não tem conta? Clique aqui para criar uma."),
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
                            TextButton(
                                child: Text("Voltar"),
                                onPressed: () {
                                  Get.offAll(WelcomeAlternativeView());
                                }),
                          ],
                        ),
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
