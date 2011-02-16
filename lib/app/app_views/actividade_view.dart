import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_views/search_profissional/search_profissional_view.dart';

class ActivityView extends StatelessWidget {
  Widget build(BuildContext context) {
    final larguraTotal = MediaQuery.of(context).size.width;
    //final alturaTotal = MediaQuery.of(context).size.height;
    //final controller = Get.put(AnimationController(largura: largura * 0.9, altura: altura * 0.8));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: ListTile(
            title: Text("Actividades da Entidade"),
            subtitle: Text("Insira os seus dados de suas atividade")),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 20, left: 25, right: 25),
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.white),
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
              Expanded(
                child: ListView.separated(
                  itemCount: 3,
                  itemBuilder: (_, index) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 10, top: 15),
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
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(CreateSessionView());
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                  child: Text("Salvar"),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey)),
                  child: Text("Ignorar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimationController extends GetxController {
  AnimationController({required this.largura, required this.altura});
  var largura = 0.0;
  var altura = 0.0;
  bool troca = false;
  List<Color> cores = [
    Colors.orange,
    Colors.red,
    Colors.blue,
    Colors.black,
    Colors.yellow,
    Colors.pink,
    Colors.brown,
    Colors.grey,
  ];
  onTap() {
    if (troca) {
      largura += 15;
      altura += 15;

      update();
    } else {
      largura -= 15;
      altura -= 15;

      update();
    }
    troca = !troca;
    Future.delayed(Duration(seconds: 2), () {
      onTap();
    });
  }

  onDoubleTap() {
    if (troca == true) {
      largura -= 10;
      altura -= 10;
      update();
    }
    troca = false;
  }
}
