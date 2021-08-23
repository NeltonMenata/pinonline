import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var _mostraSenha = true;
  Widget build(BuildContext context) {
    final larguraTotal = MediaQuery.of(context).size.width;
    final alturaTotal = MediaQuery.of(context).size.height;
    //final controller = Get.put(AnimationController(largura: largura * 0.9, altura: altura * 0.8));
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.only(top: 20, left: 25, right: 25),
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            child: ListView(
              children: [
                Container(
                  color: Colors.transparent,
                  height: (alturaTotal * 0.35) - (alturaTotal * 0.08),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(70)),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 60,
                          child: Image.asset("assets/img/logo.png"),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Seja bem-vindo a sua \nPlataforma",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  height: (alturaTotal * 0.6) - (alturaTotal * 0.04),
                  child: SingleChildScrollView(
                    child: Form(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Email",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: 'Email',
                                border: OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text("Senha",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          TextFormField(
                            obscuringCharacter: "*",
                            obscureText: _mostraSenha,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.panorama_fish_eye_rounded),
                                  onPressed: () {
                                    setState(() {
                                      _mostraSenha = !_mostraSenha;
                                    });
                                  },
                                ),
                                hintText: 'Senha',
                                border: OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.green)),
                                onPressed: () {
                                  
                                },
                                child: Text("Entrar")),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.grey)),
                                onPressed: () {},
                                child: Text("Recuperar Senha")),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            //alignment: Alignment.center,
                            width: larguraTotal * 0.7,
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.settings),
                                  onPressed: () {},
                                ),
                                Spacer(),
                                Text("Login with Google",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                        fontSize: 18))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            //alignment: Alignment.center,
                            width: larguraTotal * 0.7,
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.settings),
                                  onPressed: () {},
                                ),
                                Spacer(),
                                Text("Login with Facebook",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                        fontSize: 18))
                              ],
                            ),
                          )
                        ],
                      ),
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
