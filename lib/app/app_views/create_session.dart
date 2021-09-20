import 'package:flutter/material.dart';

import '_size/size.dart';

class CreateSessionView extends StatefulWidget {
  @override
  _CreateSessionViewState createState() => _CreateSessionViewState();
}

class _CreateSessionViewState extends State<CreateSessionView> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final larguraTotal = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(child: Icon(Icons.person)),
            SizedBox(
              width: 10,
            ),
            Text("Usuario")
          ],
        ),
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
                    Text(
                      "Encontre Profissionais certificados",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
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
                                            padding: const EdgeInsets.only(
                                                left: 35, right: 10),
                                            width: larguraPor(70, context),
                                            height: alturaPor(75, context),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.horizontal(
                                                        right:
                                                            Radius.circular(3500)),
                                                color: Colors.grey.shade400),
                                            child: Center(
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
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
                                                            border:
                                                                OutlineInputBorder()),
                                                      ),
                                                    ),
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
                                                            border:
                                                                OutlineInputBorder()),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: double.infinity,
                                                      child: ElevatedButton(
                                                          onPressed: () {},
                                                          child: Text("Pesquisar")),
                                                    )
                                                  ],
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
                      },
                      icon: Icon(Icons.search),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white24,
                height: alturaPor(60, context),
                child: ListView.separated(
                  itemCount: 3,
                  itemBuilder: (_, index) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          bottom: 10,
                          top: 15,
                        ),
                        width: larguraTotal * (24 / 100),
                        height: larguraTotal * (30 / 100),
                        decoration: BoxDecoration(
                          color: Colors.red,
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
                      Container(
                        padding: EdgeInsets.only(bottom: 10, top: 15),
                        width: larguraTotal * (24 / 100),
                        height: larguraTotal * (30 / 100),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.build_rounded, size: 45),
                            Spacer(),
                            Text("Configuração!")
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 10, top: 15),
                        width: larguraTotal * (24 / 100),
                        height: larguraTotal * (30 / 100),
                        decoration: BoxDecoration(
                          color: Colors.amber,
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
                    ],
                  ),
                  separatorBuilder: (_, index) => SizedBox(height: 20),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 2,
                color: Colors.black54,
              ),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  separatorBuilder: (c, i) => SizedBox(width: 20),
                  itemBuilder: (c, i) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}
