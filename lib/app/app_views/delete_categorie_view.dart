import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_models/categorias_model.dart';
import '../app_controller.dart/delete_controller.dart';
import 'app_components/home_components/app_bottom_bar.dart';

class DeleteCategorieView extends StatelessWidget {
  List<Categoria> get _dmainCategoria => DeleteController.controller.dcategoriaAll;
  DeleteController get _dmainController => DeleteController.controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.delete_rounded),
              onPressed: () {
                _dmainController.removeCategoria();
              })
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.red, Colors.white]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("Marque as Categorias que pretende apagar",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold
              )
              ),
              Expanded(
                child: GetBuilder<DeleteController>(
                  builder: (_) => ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: _dmainController.dtotalCategoria,
                    itemBuilder: (context, index) => Card(
                      elevation: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 100,
                            width: 200,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    _dmainCategoria.elementAt(index).nome,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue[54]),
                                  )
                                ]),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Flexible(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    height: 95,
                                    child: Text(
                                        _dmainCategoria.elementAt(index).desc),
                                  ),
                                ),
                                GetBuilder<DeleteController>(
                                  initState: (_) {},
                                  builder: (_) {
                                    return Checkbox(
                                        value: _dmainCategoria
                                            .elementAt(index)
                                            .selected,
                                        onChanged: (v) {
                                          _dmainController
                                              .toggleSelection(index);
                                        });
                                  },
                                )
                              ],
                            ),
                          ),
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
    bottomNavigationBar: bottomAppBar()   
    );
  }
}
