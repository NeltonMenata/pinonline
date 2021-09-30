import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:pinonline/app/app_controller/delete_controller.dart';
import 'package:pinonline/app/app_controller/home_controller.dart';
import 'package:pinonline/app/app_models/categorias_model.dart';
import 'package:pinonline/app/app_provider/provider_data.dart';
import 'package:pinonline/app/app_views/app_components/home_components/app_bar_main.dart';
import 'package:pinonline/app/app_views/app_components/home_components/app_bottom_bar.dart';
import 'package:pinonline/app/app_views/app_components/home_components/drawer_component.dart';
import 'package:pinonline/app/app_views/app_routes/routes.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  HomeController get _mainController => HomeController.controller;
  //List<Categoria> get _mainCategoria => HomeController.controller.categoria;
  final _form = GlobalKey<FormState>();

  var _foundItem = TextEditingController();

  HomeView() {
    _mainController.categoria = [];
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double widthScreen = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: appBarMain(),
      drawer: DrawerAccount(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
          ),
          child: Column(
            children: <Widget>[
              GetBuilder<DeleteController>(
                init: DeleteController(),
                initState: (_) {},
                builder: (_) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    child: Form(
                      key: _form,
                      child: TextFormField(
                        onChanged: (v) {},
                        validator: (v) => v == "" ? "Digite algum texto" : null,
                        controller: _foundItem,
                        decoration: InputDecoration(
                          hintText: "Procurar profissões",
                          suffixIcon: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              var _validate = _form.currentState!.validate();
                              if (_validate) {
                                _mainController.procurar(_foundItem.text);
                                Get.snackbar(
                                    "Busca", "Aguarde o resultado da busca",
                                    showProgressIndicator: true);
                                Future.delayed(Duration(seconds: 3),
                                    () => Get.toNamed(Routes.SEARCH));
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              GetBuilder<HomeController>(
                init: HomeController(),
                builder: (_) => Expanded(
                  child: FutureBuilder<List<ParseObject>>(
                    future: ProviderData.getCategoriaData(),
                    builder: (BuildContext _,
                        AsyncSnapshot<List<ParseObject>> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext _, int index) {
                              _mainController.categoria.add(Categoria(
                                  nome: snapshot.data!
                                      .elementAt(index)
                                      .get("nome")
                                      .toString(),
                                  id: index,
                                  desc: snapshot.data!
                                      .elementAt(index)
                                      .get("descricao")
                                      .toString(),
                                  selected: snapshot.data!
                                      .elementAt(index)
                                      .get("selected"),
                                  url: snapshot.data!
                                      .elementAt(index)
                                      .get("urlImage")
                                      .toString()));
                                      
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              color: Colors.blueGrey,
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          height: 100,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Image.network(
                                              snapshot.data!
                                                  .elementAt(index)
                                                  .get("urlImage")
                                                  .toString(),
                                              fit: BoxFit.fitHeight,
                                              errorBuilder: (_, __, ___) {
                                                return Text(
                                                  "Imagem não configurada!",
                                                  textAlign: TextAlign.center,
                                                );
                                              },
                                            ),
                                          )),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.65,
                                        child: ListTile(
                                          onTap: () {
                                            Get.toNamed(
                                                Routes.ENTIDADECATEGORIA,
                                                arguments: snapshot.data!
                                                    .elementAt(index)
                                                    .get("nome")
                                                    .toString());
                                          },
                                          title: Text(
                                            snapshot.data!
                                                .elementAt(index)
                                                .get("nome")
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          subtitle: Text(
                                            snapshot.data!
                                                .elementAt(index)
                                                .get("descricao")
                                                .toString(),
                                            maxLines: 5,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: index != snapshot.data!.length - 1
                                        ? Container(
                                            height: 2,
                                            color: Colors.black26,
                                          )
                                        : Container(),
                                  )
                                ],
                              );
                            });
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Column(
                            children: [
                              Icon(Icons.error_outline_rounded),
                              Text("Erro ao carregar: ${snapshot.error}")
                            ],
                          ),
                        );
                      } else {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Spacer(),
                              Text(
                                "Aguarde o resultado...",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CircularProgressIndicator(),
                              Spacer()
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomAppBar(),
    );
  }
}


