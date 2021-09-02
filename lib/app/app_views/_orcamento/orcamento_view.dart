import 'package:flutter/material.dart';
import 'package:pinonline/app/app_controller/_orcamento/orcamento_controller.dart';
import '../_size/size.dart';

// ignore: must_be_immutable
class OrcamentoView extends StatelessWidget {
  var _controller = OrcamentoController.controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 15),
                height: alturaPor(25, context),
                color: Colors.blue,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: larguraPor(15, context),
                    ),
                    ListTile(
                      title: Text("Escolhe a Entidade"),
                      subtitle: Text("Clique no botão "
                          "( + )"
                          " da Entidade que pretendes contratar para sua obra"),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        //color: Colors.amber,
                        height: alturaPor(70, context),
                        width: larguraPor(90, context),
                        child: ListView.builder(
                          itemBuilder: (context, index) => Column(
                            children: [
                              ListTile(
                                title: Text("Nome da Entidade:"),
                                subtitle:
                                    Text(_controller.entidade[index].nome),
                                trailing: CircleAvatar(
                                  child: IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        _controller.changeEntidade(index);
                                      }),
                                ),
                              ),
                              ListTile(
                                title: Text("Email da Entidade:"),
                                subtitle:
                                    Text(_controller.entidade[index].email),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  "Contacto: ${_controller.entidade[index].contacto}",
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              Divider()
                            ],
                          ),
                          itemCount: _controller.entidade.length,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
