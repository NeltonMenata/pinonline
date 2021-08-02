import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_controller/entidade_categoria_controller.dart';
import 'package:pinonline/app/app_models/entidade_model.dart';

// ignore: must_be_immutable
class EntidadePerfilView extends StatelessWidget {
  EntidadeModel selectedEntidade = EntidadeController
      .entidadeController.entidadeData[int.parse(Get.arguments)];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                //  color: Colors.blue,
                ),
            height: MediaQuery.of(context).size.height * 0.3,
            child: Center(
              child: Row(children: [
                Spacer(),
                Container(
                  height: MediaQuery.of(context).size.height * 0.28,
                  width: 10,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(15)),
                    color: Colors.orange,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.96,
                  height: MediaQuery.of(context).size.height * 0.28,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(15)),
                      color: Colors.green),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Colors.green, Colors.blue]),
                            color: Colors.black38,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                            ),
                          ),
                          child: Image.network(
                            selectedEntidade.imgUrl,
                            fit: BoxFit.fitHeight,
                            errorBuilder: (_, __, ___) {
                              return Text(
                                "\n\n\nImagem não encontratada",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              );
                            },
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.96,
                        height: MediaQuery.of(context).size.height * 0.28 * 0.2,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15))),
                        child: Text(
                          "${selectedEntidade.nome}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
              ]),
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView(
              children: [
                Text(
                  "${selectedEntidade.categoria}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45),
                ),
                ListTile(
                  title: Text(selectedEntidade.nome),
                  subtitle: Text("Técnico - ${selectedEntidade.categoria}"),
                ),
                ListTile(
                  title: Text("Contacto:"),
                  subtitle: Text("${selectedEntidade.contacto}"),
                ),
                ListTile(
                  title: Text("Email:"),
                  subtitle: Text("${selectedEntidade.email}"),
                ),
                ListTile(
                  title: Text("Localização:"),
                  subtitle: Text("${selectedEntidade.morada}"),
                ),
                ListTile(
                  title: Text("Descrição:"),
                  subtitle: Text("${selectedEntidade.desc}"),
                ),
              ],
            ),
          ),
          Container(
              height: 70,
              color: Colors.black54.withOpacity(0.3),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Contratar"),
                ),
              ))
        ],
      ),
    );
  }
}
