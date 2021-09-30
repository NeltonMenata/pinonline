import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:pinonline/app/app_provider/provider_data.dart';

// ignore: must_be_immutable

class BancoDeDadosView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextButton(
          child: Text(
            "JustBuild",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          onPressed: () {},
        ),
      ),
      body: GetBuilder<Controller>(
        init: Controller(),
        builder: (_) => Center(
          child: FutureBuilder<List<ParseObject>>(
              future: ProviderData.getCategoriaData(),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blueGrey,
                                        border: Border.all(),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    height: 100,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
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
                                      MediaQuery.of(context).size.width * 0.65,
                                  child: ListTile(
                                    onTap: () {},
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
              }),
        ),
      ),
    );
  }
}

class Controller extends GetxController {
  static final to = Get.put(Controller());
  bool completed = false;
  toCompleted() {
    completed = !completed;

    update();
  }
}
