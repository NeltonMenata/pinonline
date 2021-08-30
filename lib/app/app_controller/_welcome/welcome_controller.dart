import 'package:flutter/material.dart';
import 'package:pinonline/app/app_views/_size/size.dart';

class WelcomeAlternativeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var _larguraTotal = MediaQuery.of(context).size.width;
    //var _containerMain = _larguraTotal * 0.92;
    var _alturaTotal = MediaQuery.of(context).size.height;

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
                  SizedBox(height: _alturaTotal < 600 ? 15 : 20),
                  Text(
                    "Bem-Vindo a JustBuild",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: _alturaTotal < 600 ? 20 : 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Escolhe uma das opções para o seu devido tratamento!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: _alturaTotal < 600 ? 12 : 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      width: larguraPor(40, context),
                      height: alturaPor(40, context),
                      child: Card(
                        elevation: 5,
                        child: Column(
                          children: [
                            Icon(
                              Icons.person,
                              size: larguraPor(25, context),
                            ),
                            Spacer(),
                            Text(
                              "Preciso de um serviço.",
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text("Cliente"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      width: larguraPor(40, context),
                      height: alturaPor(40, context),
                      child: Card(
                        elevation: 5,
                        child: Column(
                          children: [
                            Icon(
                              Icons.person,
                              size: larguraPor(25, context),
                            ),
                            Spacer(),
                            Text(
                              "Faça Login ou Seja nosso parceiro",
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text("Profissional"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  onPressed: () {},
                  child: Text("Visitante"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
