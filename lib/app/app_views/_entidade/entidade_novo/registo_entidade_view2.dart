import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_controller/_entidade/entidade_novo/create_entidade_controller.dart';
import 'package:pinonline/app/app_views/_size/size.dart';

// ignore: must_be_immutable
class RegistoEntidadeView2 extends StatelessWidget {
  CreateEntidadeController get _controller =>
      CreateEntidadeController.controller;
  Widget build(BuildContext context) {
    
    //final larguraTotal = MediaQuery.of(context).size.width;
    final alturaTotal = MediaQuery.of(context).size.height;
    //final controller = Get.put(AnimationController(largura: largura * 0.9, altura: altura * 0.8));
    return WillPopScope(
      onWillPop: () async {
        _controller.toggleCategoria();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: ListTile(
              title: Text("Dados da Empresa"),
              subtitle: Text("Insira os Dados de sua entidade")),
        ),
        body: Stack(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white),
                child: ListView(
                  children: [
                    Container(
                      color: Colors.transparent,
                      height: (alturaTotal * 0.85),
                      child: GetBuilder<CreateEntidadeController>(
                        builder:(_) => Form(
                          key: _controller.formRegisto2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "CAE",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextFormField(
                                      controller: _controller.telefone,
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                          hintText: 'CAE',
                                          border: OutlineInputBorder()),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text("Nº de Funcionários",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: DropdownButton<String>(
                                            isExpanded: true,
                                            value: _controller.funValue,
                                            onChanged: (_) {
                                              _controller.toggleFun(_!);
                                            },
                                            icon: const Icon(Icons
                                                .keyboard_arrow_down_rounded),
                                            items: _controller.listaFun
                                                .map((e) =>
                                                    DropdownMenuItem<String>(
                                                        child: Text(e),
                                                        value: e))
                                                .toList()),
                                      ),
                                    ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text("Capacidade de Obras por ano",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: DropdownButton<String>(
                                            isExpanded: true,
                                            value: _controller.obraValue,
                                            onChanged: (_) {
                                              _controller.toggleObra(_!);
                                            },
                                            icon: const Icon(Icons
                                                .keyboard_arrow_down_rounded),
                                            items: _controller.listaObra
                                                .map((e) =>
                                                    DropdownMenuItem<String>(
                                                        child: Text(e),
                                                        value: e))
                                                .toList()),
                                      ),
                                    ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text("Zona de Certificação",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: DropdownButton<String>(
                                            isExpanded: true,
                                            value: _controller.zonaValue,
                                            onChanged: (_) {
                                              _controller.toggleZona(_!);
                                            },
                                            icon: const Icon(Icons
                                                .keyboard_arrow_down_rounded),
                                            hint: Text("Distritos de Portugal"),
                                            items: _controller.listaZona
                                                .map((e) =>
                                                    DropdownMenuItem<String>(
                                                        child: Text(e),
                                                        value: e))
                                                .toList()),
                                      ),
                                    ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text("Categoria",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            _controller.toggleCategoria();
                                          },
                                          child: Text(
                                              "Escolhe as categorias!"),
                                        ),
                                      ),
                                    ]),
                              ),
                              Spacer(),
                              Obx(() {
                                return Visibility(
                                  visible: _controller.isSave.value,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }),
                              Spacer(),
                              ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.green)),
                                  onPressed: () =>
                                      _controller.saveEntidade(context),
                                  child: Text("Salvar Entidade")),
                              ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.grey)),
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text("Ignorar"))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: GetBuilder<CreateEntidadeController>(
                init: CreateEntidadeController(),
                builder:(_)=> Visibility(
                  visible: _controller.showCategoria,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Card(
                      child: Container(
                          height: alturaPor(40, context),
                          color: Colors.white,
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            itemCount: _controller.listaCategoria.length,
                            itemBuilder: (context, index) {

                              return ListTile(
                                title: Text(_controller.listaCategoria[index]),
                                trailing: Checkbox(
                                    value: _controller.selectCategoria[index],
                                    onChanged: (value) {
                                      _controller.toggleSelectCategoria(index);
                                    }),
                                    onTap: (){
                                      _controller.toggleSelectCategoria(index);
                                    },
                              );
                            },
                          )),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
