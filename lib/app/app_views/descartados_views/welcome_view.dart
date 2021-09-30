import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_views/app_routes/routes.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _larguraTotal = MediaQuery.of(context).size.width;
    var _containerMain = _larguraTotal * 0.92;
    var _alturaTotal = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListView(children: [
              SizedBox(height: _alturaTotal < 600 ? 15 : 20),
              CircleAvatar(
                  radius: _alturaTotal < 600 ? 50 : 65,
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
                  //fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: _alturaTotal * 0.05,
              ),
              Container(
                height: _alturaTotal * 0.1,
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
                          style: TextStyle(
                            //fontSize: _alturaTotal < 600 ? 14 : 17,
                          ),
                          maxLines: 1,
                        ),
                        subtitle: Text(
                          "Inicia a sua Obra nova com a JustBuild a escolha número 1!",
                          style: TextStyle(
                            //fontSize: _alturaTotal < 600 ? 12 : 14,
                          ),
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
              SizedBox(height: _alturaTotal * 0.01),
              Container(
                height: _alturaTotal * 0.1,
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
                          style: TextStyle(
                            //fontSize: _alturaTotal < 600 ? 14 : 17,
                          ),
                          maxLines: 1,
                        ),
                        subtitle: Text(
                          "Com a JustBuild tens a tua Obra executada com prazo acordado!",
                          style: TextStyle(
                            //fontSize: _alturaTotal < 600 ? 12 : 14,
                          ),
                          
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
              SizedBox(height: _alturaTotal * 0.01),
              Container(
                height: _alturaTotal * 0.1,
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
                          style: TextStyle(
                            //fontSize: _alturaTotal < 600 ? 14 : 17,
                          ),
                          maxLines: 1,
                        ),
                        subtitle: Text(
                          "Encontre Profissionais de qualidade para sua obra!",
                          style: TextStyle(
                            //fontSize: _alturaTotal < 600 ? 12 : 14,
                          ),
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
              SizedBox(height: _alturaTotal * 0.01),
              Container(
                height: _alturaTotal * 0.1,
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
                          style: TextStyle(
                            //fontSize: _alturaTotal < 600 ? 14 : 17,
                          ),
                          maxLines: 1,
                        ),
                        subtitle: Text(
                          "Seja um parceiro profissional da JustBuild e aproveite o maior número de clientes no mercado!",
                          style: TextStyle(
                            //fontSize: _alturaTotal < 600 ? 12 : 14,
                          ),
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
              SizedBox(height: _alturaTotal * 0.04),
              Text("Entre em contacto connosco!")
            ]),
          ),
        ),
      ),
    );
  }
}
