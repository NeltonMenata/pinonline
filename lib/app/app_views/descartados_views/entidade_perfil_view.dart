import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_controller/entidade_categoria_controller.dart';
import 'package:pinonline/app/app_models/entidade_model.dart';
import 'package:pinonline/app/app_views/app_components/home_components/app_bottom_bar.dart';
import 'package:pinonline/app/app_views/app_routes/routes.dart';


// ignore: must_be_immutable
class EntidadePerfilView extends StatelessWidget {
  EntidadeModel selectedEntidade = EntidadeController
      .entidadeController.entidadeData[int.parse(Get.arguments)];
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final larguraTotal = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    final alturaTotal = MediaQuery.of(context).size.height;
    //final controller = Get.put(AnimationController(largura: largura * 0.9, altura: altura * 0.8));
    return Scaffold(
      body: SafeArea(
        child: Container(
         
          color: Colors.grey.shade300,
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 15,
                  left: 15,
                ),
                width: double.infinity,
                height: 200,
                color: Colors.green,
                child: Text(
                  selectedEntidade.nome,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 150.0, left: 15, right: 15),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.transparent,
                  child: ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: 80,
                          left: 15,
                        ),
                        height: larguraTotal * 0.7,
                        width: double.infinity,
                        color: Colors.white,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Column(
                            children: [
                              Text(
                                selectedEntidade.nome,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                selectedEntidade.categoria,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(right: 10, left: 10),
                                color: Colors.white,
                                width: double.infinity,
                                height: 101,
                                child: SingleChildScrollView(
                                  child: Text(
                                    selectedEntidade.desc,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black87),
                                    maxLines: 5,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Visibility(
                                    visible: true,
                                    child: TextButton(
                                        onPressed: () {},
                                        child: Text("Ler mais")),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        color: Colors.white,
                        height: 80,
                        width: double.infinity,
                        child: ListTile(
                          title: Text("Contacto: "),
                          subtitle: Text(selectedEntidade.contacto),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        color: Colors.white,
                        height: 80,
                        width: double.infinity,
                        child: ListTile(
                          title: Text("Email: "),
                          subtitle: Text(selectedEntidade.email),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 80.0,
                ),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(70),
                      child: Container(
                        color: Colors.blueAccent,
                        child: Image.network(
                          selectedEntidade.img,
                          fit: BoxFit.contain,
                          height: 140,
                          width: 140,
                          errorBuilder: (_, __, ___) {
                            return Image.asset("assets/img/logo.png");
                          },
                        ),
                      ),
                    )),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  height: alturaTotal * 0.08,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Valor: £ 10.000,00",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Spacer(),
                      ElevatedButton(
                        child: Row(
                          children: [
                            Text("Pedir Orçamento"),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                            )
                          ],
                        ),
                        onPressed: () {
                          Get.toNamed(Routes.ORCAMENTO);
                          
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomAppBarOthers(),
    );
  }
}
