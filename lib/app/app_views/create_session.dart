import 'package:flutter/material.dart';

class CreateSessionView extends StatefulWidget {
  @override
  _CreateSessionViewState createState() => _CreateSessionViewState();
}

class _CreateSessionViewState extends State<CreateSessionView> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final larguraTotal = MediaQuery.of(context).size.width;
    final alturaTotal = MediaQuery.of(context).size.height;

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
                child: Text(
                  "Registar Actividades",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: alturaTotal * 0.4,
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
                            Icon(Icons.settings),
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
                            Icon(Icons.settings),
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
                            Icon(Icons.settings),
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
                child: Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){},
                      onHorizontalDragStart: (_) {
                        setState(() {
                          currentIndex = 1;
                        });
                      },
                      child: Visibility(
                        visible: currentIndex == 0 ? true : false,
                        child: Container(
                          alignment: Alignment.center,
                          height: larguraTotal * 0.4,
                          width: larguraTotal * 0.6,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            "Primeiro Conteudo",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){},
                      onHorizontalDragStart: (_) {
                        setState(() {
                          currentIndex = 2;
                        });
                      },
                      child: Visibility(
                        visible: currentIndex == 1 ? true : false,
                        child: Container(
                          alignment: Alignment.center,
                          height: larguraTotal * 0.4,
                          width: larguraTotal * 0.6,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            "Segundo Conteudo",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){},
                      onHorizontalDragEnd: (_) {
                        setState(() {
                          currentIndex = 0;
                        });
                      },
                      child: Visibility(
                        visible: currentIndex == 2 ? true : false,
                        child: Container(
                          alignment: Alignment.center,
                          height: larguraTotal * 0.4,
                          width: larguraTotal * 0.6,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            "Terceiro Conteudo",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
              ),
              Container(
                  height: 50,
                  color: Colors.black87,
                  child: Row(children: [
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = 0;
                        });
                      },
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color:
                                currentIndex == 0 ? Colors.blue : Colors.grey),
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = 1;
                        });
                      },
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color:
                                currentIndex == 1 ? Colors.blue : Colors.grey),
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = 2;
                        });
                      },
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color:
                                currentIndex == 2 ? Colors.blue : Colors.grey),
                      ),
                    ),
                    Spacer(),
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
