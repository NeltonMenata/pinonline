import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_provider/provider_data.dart';
import 'package:pinonline/app/app_views/_obra/obra_save_view.dart';
import '../_size/size.dart';

// ignore: must_be_immutable
class OrcamentoView extends StatelessWidget {
  var _entidade = ProviderData.entidadeLista;

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
                      subtitle: Text(
                          "Selecione a entidade para arrancar com a sua obra"),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: double.infinity,
                        width: larguraPor(90, context),
                        child: ListView.builder(
                          itemBuilder: (context, index) => Column(
                            children: [
                              ListTile(
                                title: Text("Nome da Entidade:"),
                                subtitle: Text(_entidade[index].nome),
                                trailing: CircleAvatar(
                                  child: IconButton(
                                      icon: Icon(Icons.add), onPressed: () {
                                        Get.to(ObraSaveView());
                                      }),
                                ),
                              ),
                              ListTile(
                                title: Text("Email da Entidade"),
                                subtitle: Text(_entidade[index].email),
                              ),
                              SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    "Contacto: ${_entidade[index].contacto}",
                                    textAlign: TextAlign.right,
                                  )),
                              Divider()
                            ],
                          ),
                          itemCount: _entidade.length,
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
