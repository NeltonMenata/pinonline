import 'package:flutter/material.dart';
import '../app_controller.dart/home_controller.dart';
import 'app_components/home_components/app_bar_main.dart';
import 'app_components/home_components/app_bottom_bar.dart';

// ignore: must_be_immutable
class SearchView extends StatelessWidget {
  
  get _mainFoundCategoria => HomeController.controller.foundCategoria;
  get _foundCategoriaCount => HomeController.controller.foundCategoria.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSearch(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: double.infinity,
          child: ListView.builder(
            itemCount: _foundCategoriaCount,
            itemBuilder: (context, index) => Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.blue,
                    height: 90,
                    width: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                          "assets/img/imagem.jpg",
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 200,
                      child: Text(_mainFoundCategoria.elementAt(index).nome,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      //BOTTOM BAR
      bottomNavigationBar: bottomAppBar()
    );
  }
}
