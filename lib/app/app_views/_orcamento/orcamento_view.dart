import 'package:flutter/material.dart';
import 'package:pinonline/app/app_controller/_orcamento/orcamento_controller.dart';
import 'package:pinonline/app/app_views/app_components/home_components/app_bottom_bar.dart';
import '../_size/size.dart';

// ignore: must_be_immutable
class OrcamentoView extends StatelessWidget {
  var _controller = OrcamentoController.controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profissionais"),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: Container(
                    padding: const EdgeInsets.only(top: 15),
                    color: Colors.white,
                    width: double.infinity,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: _controller.entidade.length,
                      itemBuilder: (_, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                width: larguraPor(30, context),
                                height: larguraPor(45, context),
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                        left: 5,
                                        right: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(),
                                      ),
                                      child: Text(
                                        "Recomendado",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Image.network(
                                      _controller.entidade
                                          .elementAt(index)
                                          .img,
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.fill,
                                      errorBuilder: (_, __, ___) {
                                        return Image.asset(
                                            "assets/img/logo1.png");
                                      },
                                    ),
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
                              width: larguraPor(40, context),
                              height: larguraPor(45, context),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    title: Text(_controller.entidade
                                        .elementAt(index)
                                        .nome),
                                    subtitle: Text(_controller.entidade
                                        .elementAt(index)
                                        .categoria),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    child: Text("5 visitas"),
                                    decoration:
                                        BoxDecoration(border: Border.all()),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                color: Colors.transparent,
                                width: larguraPor(25, context),
                                height: larguraPor(45, context),
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
                                      onPressed: () {
                                        _controller.changeEntidade(index);
                                      },
                                    )
                                  ],
                                )),
                          ],
                        );
                      },
                    )),
              ),
            ],
          ),
        ),bottomNavigationBar: bottomAppBar(),
      ),
    );
  }
}
