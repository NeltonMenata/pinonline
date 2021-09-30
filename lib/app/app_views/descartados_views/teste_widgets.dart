import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_views/app_components/home_components/app_bottom_bar.dart';

class View extends StatelessWidget {
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final larguraTotal = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    final alturaTotal = MediaQuery.of(context).size.height;
    //final controller = Get.put(AnimationController(largura: largura * 0.9, altura: altura * 0.8));
    return Scaffold(
      body: SafeArea(
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
                  "Gonçalo Silva, Construções",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 150.0, left: 15, right: 15),
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
                        ),
                        height: larguraTotal * 0.7,
                        width: double.infinity,
                        color: Colors.white,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Column(
                            children: [
                              Text(
                                "Gonçalo Silva, Construções",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Categoria - Profissão",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(right: 10, left: 10),
                                color: Colors.white,
                                width: double.infinity,
                                height: 101,
                                child: SingleChildScrollView(
                                  child: Text(
                                    "      Corpo Principal - Descrição asdflçkasjdfalksjdf asldkjfalçskdjfaçlsjdfç asldkfjlasdjfçasjdlf salkdjflaskdjflkçasjd sldkfjaçlsdjflasjd laskdjflçaskdjfalskdjf adklfjaçdfaçjf dkçjfçalksjdflaksdç asldkfjaçslkdfjaçlsdf alkdjflaksdjflaçsdf çasdkfjlkasdçfjalksd çalsdjfklasdjf",
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
                                        onPressed: () {},
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
                          subtitle: Text(""),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        color: Colors.white,
                        height: 80,
                        width: double.infinity,
                        child: ListTile(
                          title: Text("Email: "),
                          subtitle: Text(""),
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
                    child: CircleAvatar(
                      radius: 70,
                    )),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  height: alturaTotal * 0.08,
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
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomAppBarOthers(),
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

/*

Center(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.white),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                color: Colors.transparent,
                height: (alturaTotal * 0.4) - (alturaTotal * 0.08),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(70)),
                      child: CircleAvatar(
                        radius: 60,
                        child: Image.asset("assets/img/logo.png"),
                      ),
                    ),
                    Text(
                      "Cadastro",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.transparent,
                height: (alturaTotal * 0.6) - (alturaTotal * 0.08),
                child: ListView.separated(
                    itemBuilder: (_, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              width: larguraTotal * (30 / 100),
                              height: larguraTotal * (45 / 100),
                              color: Colors.transparent,
                              child: Column(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                    ),
                                    child: Text(
                                      "Recomendado",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Image.asset("assets/img/logo.png"),
                                  Row(
                                    children: [
                                      Icon(Icons.star, color: Colors.amber),
                                      Icon(Icons.star, color: Colors.amber),
                                      Icon(Icons.star, color: Colors.amber),
                                      Icon(Icons.star),
                                      Icon(Icons.star),
                                    ],
                                  )
                                ],
                              )),
                          Container(
                              color: Colors.transparent,
                              width: larguraTotal * (40 / 100),
                              height: larguraTotal * (45 / 100),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    title: Text("Aphit. casas de madeira"),
                                    subtitle: Text("Casas de Madeira"),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    child: Text("5 visitas"),
                                    decoration:
                                        BoxDecoration(border: Border.all()),
                                  ),
                                ],
                              )),
                          Container(
                              color: Colors.transparent,
                              width: larguraTotal * (25 / 100),
                              height: larguraTotal * (45 / 100),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    title: Text("£ 10.000,00"),
                                    subtitle: Text("£ 12.000,00",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough)),
                                  ),
                                  Spacer(),
                                  ElevatedButton(
                                    child: Text("Consultar"),
                                    onPressed: () {},
                                  )
                                ],
                              )),
                        ],
                      );
                    },
                    separatorBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 10, left: 5, right: 5),
                        child: Container(
                          color: Colors.grey,
                          height: 2,
                        ),
                      );
                    },
                    itemCount: 3),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                color: Colors.green.shade600,
                height: 80,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      iconSize: 45,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.book,
                        color: Colors.white,
                      ),
                      iconSize: 45,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                      iconSize: 45,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      iconSize: 45,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

 */