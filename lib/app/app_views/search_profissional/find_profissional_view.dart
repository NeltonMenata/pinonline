import 'package:flutter/material.dart';
import 'package:pinonline/app/app_views/_size/size.dart';

// ignore: must_be_immutable
class FindProfissionalView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            color: Colors.grey.shade300,
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 15,
                    left: 15,
                  ),
                  width: double.infinity,
                  height: 200,
                  color: Colors.green,
                  child: Text(
                    "Nome",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 150.0, left: 15, right: 15),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.transparent,
                    child: ListView(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            top: 80,
                            left: 15,
                            right: 15,
                          ),
                          height: larguraPor(70, context),
                          width: double.infinity,
                          color: Colors.white,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Column(
                              children: [
                                Text(
                                  "Nome",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Categoria",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 10),
                                  color: Colors.black12,
                                  width: double.infinity,
                                  height: 101,
                                  child: SingleChildScrollView(
                                    child: Text(
                                      "Descrição",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black87),
                                      maxLines: 5,
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    Visibility(
                                      visible: true,
                                      child: TextButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        "Descrição Completa"),
                                                    content: Text(
                                                        "Descrição Completa"),
                                                    actions: [
                                                      TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  context),
                                                          child: Text("Ok"))
                                                    ],
                                                  );
                                                });
                                          },
                                          child: Text("Ler mais")),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          color: Colors.white,
                          height: 80,
                          width: double.infinity,
                          child: ListTile(
                            title: Text("Contacto: "),
                            subtitle: Text(
                                "941 357 140"),
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          color: Colors.white,
                          height: 80,
                          width: double.infinity,
                          child: ListTile(
                            title: Text("Email: "),
                            subtitle:
                                Text("neltonmenataditec@gmail.com"),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 80.0,
                  ),
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(70),
                        child: Container(
                          color: Colors.blueAccent,
                          child: Image.network(
                            "",
                            fit: BoxFit.contain,
                            height: 140,
                            width: 140,
                            errorBuilder: (_, __, ___) {
                              return Image.asset(
                                "assets/img/logo1.png",
                                fit: BoxFit.contain,
                                height: 140,
                                width: 140,
                              );
                            },
                          ),
                        ),
                      )),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    height: alturaPor(8, context),
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Valor: £ 10.000,00",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Spacer(),
                        ElevatedButton(
                          child: Row(
                            children: [
                              Text("Pedir Orçamento"),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                              )
                            ],
                          ),
                          onPressed: () {
                           
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
  
