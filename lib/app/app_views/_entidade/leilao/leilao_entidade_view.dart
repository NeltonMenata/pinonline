import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:pinonline/app/app_views/_entidade/leilao/leilao_admin_view.dart';
import 'package:pinonline/app/app_views/_size/size.dart';

class LeilaoEntidadeView extends StatelessWidget {
  LeilaoAdminController get controller => LeilaoAdminController.controller;
  @override
  Widget build(BuildContext context) {
    String _objectIdEntidade = Get.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: ListView(
        children: [
          SizedBox(
            height: alturaPor(90, context),
            child: FutureBuilder<List<ParseObject>>(
              future: controller.entidadeListaPropostaLeilao(_objectIdEntidade),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  return ListView.separated(
                    separatorBuilder: (context, index)=>Divider(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index){
                    print(snapshot.data![index]);
                  return ListTile(
                    title: Column(
                      children: [
                        Row(
                          children: [
                            Text("Cliente: ", style: TextStyle(fontWeight: FontWeight.bold),),
                            Text(snapshot.data![index]["leilao"]["cliente"]["nome"].toString()),
                          ],
                          
                        ),
                        Row(
                          children: [
                            Text("Valor de Leilão: ", style: TextStyle(fontWeight: FontWeight.bold),),
                            Text(snapshot.data![index]["leilao"]["valorMax"].toString()),
                          ],
                        ),
                        SizedBox(height: 10,)
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Digite o valor de Proposta para esse serviço",
                              border: OutlineInputBorder(
                              
                            )),
                          ),
                        ),
                       SizedBox(width: 10,),
                        Icon(Icons.send_rounded)
                      ],
                    ),
                  );
                });

                
                }else if(snapshot.hasError){
                  Get.snackbar("Erro", "Mensagem do erro: ${snapshot.error}");
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
          
        ],
      ),),
      
    );
  }
}