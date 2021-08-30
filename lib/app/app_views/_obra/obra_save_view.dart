import 'package:flutter/material.dart';
import 'package:pinonline/app/app_views/_size/size.dart';

class ObraSaveView extends StatelessWidget {
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
                  subtitle:
                      Text("Selecione a entidade para arrancar com a sua obra"),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Container(
                child: ElevatedButton.icon(
                  onPressed: () {
                    /*
                    OrcamentoModel _orcamento = Get.arguments;
                    ProviderData.obraLista.add(
                      ObraModel(
                        orcamento: _orcamento,
                        entidade: _entidade[0],
                      ),
                    );
                  */
                  },
                  
                  icon: Icon(Icons.add),
                  label: Text("Guardar"),
                ),
              ),
              ],
      )),
    ));
  }
}
