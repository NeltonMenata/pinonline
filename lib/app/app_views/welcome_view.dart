import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_views/app_routes/routes.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _larguraTotal = MediaQuery.of(context).size.width;
    var _containerMain = _larguraTotal * 0.92;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListView(children: [
              SizedBox(height: 20),
              CircleAvatar(
                  radius: 65, child: Image.asset("assets/img/logo.png")),
              SizedBox(height: 20),
              Text(
                "Bem-Vindo a JustBuild",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Escolhe uma das opções para o seu devido tratamento!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Container(
                        width: _containerMain * 0.3,
                        height: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(15))),
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 35,
                            child: Image.asset("assets/img/logo.png"))),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Quer iniciar uma Obra nova",
                          maxLines: 2,
                        ),
                        subtitle: Text(
                          "Inicia a sua Obra nova com a JustBuild a escolha número 1!",
                          maxLines: 2,
                        ),
                        onTap: () {
                          Get.toNamed(Routes.LOGIN);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Container(
                        width: _containerMain * 0.3,
                        height: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(15))),
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 35,
                            child: Image.asset("assets/img/logo.png"))),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Quer passar a Gestão da sua Obra para nós",
                          maxLines: 2,
                        ),
                        subtitle: Text(
                          "Com a JustBuild tens a tua Obra executada com prazo acordado!",
                          maxLines: 2,
                        ),
                        onTap: () {
                          Get.toNamed(Routes.LOGIN);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Container(
                        width: _containerMain * 0.3,
                        height: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(15))),
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 35,
                            child: Image.asset("assets/img/logo.png"))),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Quer ver os Profissionais perto de você",
                          maxLines: 2,
                        ),
                        subtitle: Text(
                          "Encontre Profissionais de qualidade para sua obra!",
                          maxLines: 2,
                        ),
                        onTap: () {
                          Get.toNamed(Routes.HOME);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Container(
                        width: _containerMain * 0.3,
                        height: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(15))),
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 35,
                            child: Image.asset("assets/img/logo.png"))),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Quer ser nosso parceiro Profissional",
                          maxLines: 2,
                        ),
                        subtitle: Text(
                          "Seja um parceiro profissional da JustBuild e aproveite o maior número de clientes no mercado!",
                          maxLines: 2,
                        ),
                        onTap: () {
                          Get.toNamed(Routes.CREATEUSER);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text("Entre em contacto connosco!")
            ]),
          ),
        ),
      ),
    );
  }
}
