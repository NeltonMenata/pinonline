import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_controller/_cliente/cliente_login_controller.dart';
import 'package:pinonline/app/app_controller/_cliente/cliente_obra_nova_controller.dart';
import 'package:pinonline/app/app_views/_size/size.dart';
import 'package:pinonline/app/app_views/app_components/home_components/app_bottom_bar.dart';

// ignore: must_be_immutable
class ClienteObraNovaView extends StatelessWidget {
  ClienteObraNovaController get _controller =>
      ClienteObraNovaController.controller;
  ClienteLoginController get _controllerLogin =>
      ClienteLoginController.controller;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  height: alturaPor(20, context),
                  width: double.infinity,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(larguraPor(15.5, context)),
                        child: CircleAvatar(
                            backgroundColor: Colors.green,
                            radius: larguraPor(15, context),
                            child: Stack(
                              children: [
                                Center(child: CircularProgressIndicator()),
                                Image.network(
                                  _controllerLogin.cliente[0].img,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Obx(
                            () => Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: _controller.isDocSelect.value
                                      ? Colors.green
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all()),
                              child: TextButton.icon(
                                  label: Text("Carregar um documento PDF"),
                                  onPressed: () {
                                    _controller.selectFile();
                                  },
                                  icon: Icon(_controller.isDocSelect.value
                                      ? Icons.file_download_done
                                      : Icons.file_download)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text("Nome",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(_controllerLogin.cliente[0].nome),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text("Email",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(_controllerLogin.cliente[0].email),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text("Telemóvel",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child:
                                    Text(_controllerLogin.cliente[0].contacto),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text("Tipo",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text("Indefinido"),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          height: alturaPor(30, context),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _controller.descOrcamento,
                                maxLines: 4,
                                decoration: InputDecoration(
                                  hintText:
                                      "Descreva o Assunto da sua obra aqui!",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green[500]),
                          ),
                          onPressed: () {
                            Get.back();
                          },
                          child: Text("Voltar")),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green[500]),
                          ),
                          onPressed: _controller.continuar,
                          child: Text("Continuar")),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: bottomAppBar(),
        ),
      ),
    );
  }
}
