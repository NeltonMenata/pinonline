import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:pinonline/app/app_views/_cliente/cliente_login_view.dart';
import 'package:pinonline/app/app_views/_entidade/entidade_login_view.dart';
import 'package:pinonline/app/app_views/_size/size.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_views/search_profissional/search_profissional_view.dart';
import 'package:dotted_border/dotted_border.dart';

class WelcomeAlternativeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var _larguraTotal = MediaQuery.of(context).size.width;
    //var _containerMain = _larguraTotal * 0.92;
    var _alturaTotal = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10),
                color: Colors.white70,
                width: double.infinity,
                height: alturaPor(30, context),
                child: Column(children: [
                  Container(
                      height: alturaPor(20, context),
                      child: Image.asset("assets/img/logo1.png")),
                  Spacer(),
                  GestureDetector(
                    onTap: () async {
                      final entidade = ParseObject("Entidade");
                      final query = QueryBuilder(entidade)
                        ..whereEqualTo("nome", "Nelton Menata");

                      final response = await query.query();
                      print(response.result[0]["img"]["url"]);
                      final response1 = await entidade.getObject("UCieaBIVL0");
                      entidade.objectId = "UCieaBIVL0";
                      entidade.set("nome", "Manuel dos Santos");
                      await entidade.save();
                      print(response1.result);

                      print(response1.result["nome"]);
                      /*
                      final cliente = ParseObject("Cliente")
                      ..objectId = "TmRzlQT2F8"
                      ..set("nome", "Nelton Menata");
                      
                      
                      await cliente.save();
                        cliente.objectId = "7vnWyivY8z";
                        await cliente.delete();*/
                      /*
                      ..set("nome", "Malua Menata")
                      ..set("morada", "Zango 3")
                      ..set("contacto", "946409964")
                      ..set("email","maluamenata@gmail.com")
                      ;

                      final ParseResponse response = await cliente.save();
                      print(response.results![0].objectId);
                      */
                    },
                    child: Text(
                      "Seja bem-vindo a sua plataforma",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: _alturaTotal < 600 ? 16 : 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade800,
                          fontFamily: "Times New Roman"),
                    ),
                  ),
                ]),
              ),
              Expanded(
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(ClienteLoginView());
                              },
                              child: DottedBorder(
                                color: Colors.grey,
                                strokeWidth: 2,
                                dashPattern: [10, 10],
                                borderType: BorderType.RRect,
                                radius: Radius.circular(100),
                                padding: EdgeInsets.all(6),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  width: larguraPor(35, context),
                                  height: larguraPor(35, context),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.person,
                                    size: larguraPor(25, context),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Particular",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(EntidadeLoginView());
                              },
                              child: DottedBorder(
                                color: Colors.grey,
                                strokeWidth: 2,
                                dashPattern: [10, 10],
                                borderType: BorderType.RRect,
                                radius: Radius.circular(100),
                                padding: EdgeInsets.all(6),
                                child: Container(
                                  padding:
                                      EdgeInsets.all(larguraPor(8, context)),
                                  width: larguraPor(35, context),
                                  height: larguraPor(35, context),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                      "assets/img/logo_profissional.png",
                                      fit: BoxFit.fill),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Profissional",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
              SizedBox(
                height: larguraPor(30, context),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: larguraPor(53, context),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 12, top: 12),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                              image: AssetImage("assets/img/linha_btn.png"),
                              fit: BoxFit.fill)),
                      child: Container(
                        width: larguraPor(52, context),
                        height: larguraPor(30, context),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(150),
                            topRight: Radius.circular(150),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.search_rounded, color: Colors.grey.shade700, size: 35),
                            TextButton(
                              onPressed: () {
                                Get.to(CreateSessionView());
                              },
                              child: Text(
                                "Encontre aqui o seu Profissional",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.grey.shade700),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      /*
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.to(PagamentoView());
      },),
      */
    );
  }
}
