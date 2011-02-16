import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../_size/size.dart';
import 'find_profissional_view.dart';

class CreateSessionView extends StatefulWidget {
  @override
  _CreateSessionViewState createState() => _CreateSessionViewState();
}

class _CreateSessionViewState extends State<CreateSessionView> {
  //var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var lista1 = ["Serviços", "Construção", "Remodelações"];
    var lista2 = ["Mudanças", "Materias de Construção", "Outros Serviços"];
    final larguraTotal = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(child: Icon(Icons.person)),
            SizedBox(
              width: 10,
            ),
            Text(
              "Olá, Seja bem vindo ao JustBuild!",
              style: TextStyle(
                fontSize: 14,
              ),
            )
          ],
        ),
        backgroundColor: Colors.green.shade500,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    Text(
                      "Encontre Profissionais certificados",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _pesquisar(context);
                      },
                      icon: Icon(Icons.search),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white24,
                height: alturaPor(50, context),
                child: ListView.separated(
                  itemCount: 3,
                  itemBuilder: (_, index) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 5,
                        child: Container(
                          padding: EdgeInsets.only(
                            bottom: 10,
                            top: 15,
                          ),
                          width: larguraTotal * (24 / 100),
                          height: larguraTotal * (30 / 100),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                Icons.build_rounded,
                                size: 45,
                              ),
                              Spacer(),
                              Text(
                                lista1[index],
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 5,
                        child: Container(
                          padding: EdgeInsets.only(bottom: 10, top: 15),
                          width: larguraTotal * (24 / 100),
                          height: larguraTotal * (30 / 100),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Icon(Icons.build_rounded, size: 45),
                              Spacer(),
                              Text(
                                lista2[2],
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 5,
                        child: Container(
                          padding: EdgeInsets.only(bottom: 10, top: 15),
                          width: larguraTotal * (24 / 100),
                          height: larguraTotal * (30 / 100),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                Icons.build_rounded,
                                size: 45,
                              ),
                              Spacer(),
                              Text("Configuração!")
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  separatorBuilder: (_, index) => SizedBox(height: 20),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: 15, bottom: 10),
                          width: double.infinity,
                          child: Text(
                            "Parceiros",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Container(
                        width: double.infinity,
                        height: larguraPor(40, context),
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          separatorBuilder: (c, i) => SizedBox(width: 20),
                          itemBuilder: (c, i) => Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: larguraPor(40, context),
                                width: larguraPor(30, context),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        height: double.infinity,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(15),
                                          ),
                                        ),
                                        child: Text("Imagem"),
                                      ),
                                    ),
                                    Text(
                                      "Primeiro Conteudo",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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

  Future _pesquisar(BuildContext context) {
    return showDialog(
        context: context,
        barrierColor: Colors.transparent,
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Container(
                height: alturaPor(100, context),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  reverse: true,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: larguraPor(35, context),
                          height: double.infinity,
                        )),
                    Align(
                      child: Container(
                        padding:
                            EdgeInsets.only(right: 30, top: 30, bottom: 30),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/img/linha_pesquisar.png"),
                              fit: BoxFit.fill),
                        ),
                        child: Container(
                          padding: const EdgeInsets.only(left: 55, right: 10),
                          width: larguraPor(70, context),
                          height: alturaPor(75, context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(3500)),
                              color: Colors.grey.shade300),
                          child: Center(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "O que precisas?",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal),
                                  ),
                                  Container(
                                    height: 50,
                                    width: double.infinity,
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    "Onde?",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal),
                                  ),
                                  Container(
                                    height: 50,
                                    width: double.infinity,
                                    child: TextField(
                                      decoration: InputDecoration(
                                          hoverColor: Colors.green.shade500,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.green.shade500),
                                        ),
                                        onPressed: () {
                                          Get.back();
                                          Get.to(FindProfissionalView());
                                        },
                                        child: Text("Pesquisar")),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
