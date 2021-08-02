import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:pinonline/app/app_models/entidade_model.dart';
import 'package:pinonline/app/app_provider/provider_data.dart';
import '../app_controller/entidade_categoria_controller.dart';
import 'app_routes/routes.dart';



// ignore: must_be_immutable
class EntidadeCategoriaView extends StatelessWidget {
  List<EntidadeModel> get entidadeAll =>
      EntidadeController.entidadeController.entidadeData;
  
  String _valor = "Nome";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profissionais"),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(color: Colors.transparent),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 25),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.15 * 0.45,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.orange),
                    child: DropdownButton(
                      onChanged: (value) {
                        print(value);
                        //setState(() {
                        //  _valor = value.toString();
                        //});
                      },
                      //value: Text(_valor),
                      hint: Text(
                        "Busca: $_valor",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      //selectedItemBuilder: (_){return [Text("")];},
                      items: [
                        DropdownMenuItem(
                          child: Text("Nome"),
                          value: "Nome",
                        ),
                        DropdownMenuItem(
                          child: Text("Profissão"),
                          value: "Profissão",
                        ),
                        DropdownMenuItem(
                          child: Text("Morada"),
                          value: "Morada",
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.only(left: 25, right: 25),
                    height: MediaQuery.of(context).size.height * 0.15 * 0.45,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(15)),
                        color: Colors.green),
                    child: TextField(
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          print(Get.arguments);
                        },
                      )),
                    ),
                  ),
                  
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                width: double.infinity,
                child: FutureBuilder<List<ParseObject>>(
                    future: ProviderData.getEntidadeData(),
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemBuilder: (_, index) {
                              EntidadeController.entidadeController.entidadeData
                                  .add(EntidadeModel(
                                nome:
                                    snapshot.data!.elementAt(index).get("nome"),
                                categoria: snapshot.data!
                                    .elementAt(index)
                                    .get("categoria"),
                                desc: snapshot.data!
                                    .elementAt(index)
                                    .get("descricao"),
                                email: snapshot.data!
                                    .elementAt(index)
                                    .get("email"),
                                contacto: snapshot.data!
                                    .elementAt(index)
                                    .get("contacto"),
                                morada: snapshot.data!
                                    .elementAt(index)
                                    .get("morada"),
                                imgUrl: snapshot.data!
                                    .elementAt(index)
                                    .get("imgUrl"),
                                imgPerfilUrl: snapshot.data!
                                    .elementAt(index)
                                    .get("imgPerfilUrl"),
                                videoUrl: snapshot.data!
                                    .elementAt(index)
                                    .get("videoUrl"),
                              ));
                              if (Get.arguments.toString().toLowerCase() ==
                                  entidadeAll
                                      .elementAt(index)
                                      .categoria
                                      .toLowerCase()) {
                                
                                return Column(
                                  children: [
                                    ListTile(
                                      onTap: () {
                                        Get.toNamed(Routes.ENTIDADEPERFIL,
                                            arguments: "$index");
                                      },
                                      leading: CircleAvatar(
                                        child: Image.network(
                                          entidadeAll
                                              .elementAt(index)
                                              .imgPerfilUrl,
                                          errorBuilder: (_, __, ___) {
                                            return Icon(
                                                Icons.person_outline_sharp);
                                          },
                                        ),
                                      ),
                                      title: Text(
                                          entidadeAll.elementAt(index).nome),
                                      subtitle: Text(entidadeAll
                                          .elementAt(index)
                                          .categoria),
                                      trailing: Text(
                                          entidadeAll.elementAt(index).morada),
                                    ),
                                    Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        height: 1,
                                        color: Colors.grey)
                                  ],
                                );
                              } else {
                                return Container();
                              }
                            },
                            itemCount: snapshot.data!.length);
                      } else if (snapshot.hasError) {
                        return Text("Erro ao conectar");
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
