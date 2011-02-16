import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_controller/_cliente/cliente_login_controller.dart';
import 'package:pinonline/app/app_models/cliente_model.dart';
import 'package:pinonline/app/app_views/_cliente/pagamento/pagamento_controller.dart';

class EfectuaPagamento extends StatelessWidget {
  PagamentoController get _controller => PagamentoController.controller;
  ClienteModel get _cliente => ClienteLoginController.controller.cliente[0];
  @override
  Widget build(BuildContext context) {
    var objectIdLeilao = Get.arguments.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text("Efectuar Pagamento"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.all(8), child: Text("Obra: ")),
            Padding(padding: EdgeInsets.all(8), child: Text("Descrição: ")),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () {
                  _controller.carregarImagem();
                },
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(),
                    ),
                    child: Obx(
                      () => Center(
                        child: _controller.isDone.value
                            ? Image.file(
                                _controller.file!,
                              )
                            : Text("Seleciona a imagem de comprovativo: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Descrição do Pagamento")),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      //border: OutlineInputBorder(),
                      labelText: "Valor de Pagamento")),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(40),
                    right: Radius.circular(40),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    _controller.sendPagamento(
                        objectIdCliente: _cliente.objectId,
                        objectIdLeilao: objectIdLeilao);
                  },
                  child: Text("Enviar"),
                ),
              ),
            ),
            Expanded(
              child: Center(
                  child: Visibility(
                      visible: _controller.isSend.value,
                      child: CircularProgressIndicator())),
            )
          ],
        ),
      ),
    );
  }
}
