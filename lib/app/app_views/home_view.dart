import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_controller.dart/delete_controller.dart';
import '../app_views/app_routes/routes.dart';
// ignore: unused_import
import '../app_controller.dart/home_controller.dart';
import 'app_components/home_components/app_bar_main.dart';
import 'app_components/home_components/app_bottom_bar.dart';
import 'app_components/home_components/drawer_component.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  List get _mainCategoria => HomeController.controller.categoriaAll;
  HomeController get _mainController => HomeController.controller;

  final _form = GlobalKey<FormState>();

  var _foundItem = TextEditingController();

  var nomes = ["Nelton", "Capaxe", "Menata"];

  var diagonal = Radius.circular(15);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double widthScreen = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: appBarMain(),
      drawer: DrawerAccount(),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 4.0, right: 4.0),
        child: Column(
          children: <Widget>[
            GetBuilder<DeleteController>(
              init: DeleteController(),
              initState: (_) {},
              builder: (_) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
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
            Flexible(
              flex: 8,
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: _mainController.totalCategoria,
                itemBuilder: (context, index) => Card(
                  elevation: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 100,
                        width: 200,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      "assets/img/imagem.jpg", //_mainCategoria.elementAt(index).url,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                _mainCategoria.elementAt(index).nome,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[54]),
                              )
                            ]),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          height: 95,
                          child: Text(_mainCategoria.elementAt(index).desc),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomAppBar()
    );
  }
}
