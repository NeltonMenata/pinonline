import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:pinonline/app/app_models/entidade_model.dart';
import 'package:pinonline/app/app_models/leilao_cliente_model.dart';

import 'leilao_admin_select_view.dart';

class LeilaoAdminView extends StatelessWidget {
  const LeilaoAdminView({Key? key}) : super(key: key);
  LeilaoAdminController get controller => LeilaoAdminController.controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(actions: [], title: Text("Leilões Solictados por Cliente")),
      body: Center(
          child: FutureBuilder<List<ParseObject>>(
        future: controller.listaLeilao(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Cliente: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            snapshot.data![index]["cliente"]["nome"].toString(),
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      ListTile(
                        title: Text(
                          "Descrição: " +
                              snapshot.data![index].get("descricao"),
                        ),
                        subtitle: Text(
                          "Valor de Leilão: " +
                              snapshot.data![index].get("valorMax").toString(),
                        ),
                        trailing: TextButton.icon(
                            onPressed: () {
                              Get.to(LeilaoAdminSelectView(),
                                  arguments: snapshot.data![index]["objectId"]
                                      .toString());
                            },
                            icon: Icon(Icons.send_rounded),
                            label: Text("Enviar para:")),
                        onTap: () {},
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return CircularProgressIndicator();
          }
        },
      )),
    );
  }
}

class LeilaoAdminController extends GetxController {
  static final controller = Get.put(LeilaoAdminController());

  LeilaoClienteModel? leilao;
  final List<EntidadeModel>? entidade = [];

  // Variavel que seleciona todos
  bool isSelected = false;

  // Variavel que verifica se está enviando proposta
  var isSend = false.obs;

  toggleSelectEntidade(bool value, int index) {
    entidade![index].isSelected = value;
    update();
  }

  void toggleSelectionAll() {
    isSelected = !isSelected;
    for (int c = 0; c < entidade!.length; c++) {
      entidade![c].isSelected = isSelected;
    }
    update();
  }

// Função que envia uma Proposta Leilao no Back4app na class PropostaLeilao
//
  Future<void> enviaPropostaLeilao(String objectIdLeilao) async {
    entidade!.forEach((element) async {
      if (element.isSelected) {
        final query = QueryBuilder(ParseObject("PropostaLeilao"))
          ..whereEqualTo(
              "entidade",
              (ParseObject("Entidade")..objectId = element.objectId)
                  .toPointer())
          ..whereEqualTo("leilao",
              (ParseObject("Leilao")..objectId = objectIdLeilao).toPointer());
        final response = await query.query();

        if (response.results != null) {
          Get.snackbar("Proposta Leilão",
              "O usuário ${element.nome} já recebeu essa proposta de leilão");
          return;
        }
        final propostaLeilao = ParseObject("PropostaLeilao")
          ..set(
              "entidade", ParseObject("Entidade")..objectId = element.objectId)
          ..set("leilao", ParseObject("Leilao")..objectId = objectIdLeilao)
          ..set("propostaAceite", false);
        await propostaLeilao.save();
        print("Enviado ${element.nome}");
      }
    });
  }

  // Lista todos os pedidos de Leilão
  Future<List<ParseObject>> listaLeilao() async {
    try {
      final queryLeilao = QueryBuilder(ParseObject("Leilao"))
        ..includeObject(["cliente"]);
      final response = await queryLeilao.query();
      if (response.results != null && response.success) {
        return response.results as List<ParseObject>;
      }
      return [];
    } catch (e) {
      Get.snackbar("Erro", "Erro ao consultar os Leilões no sistema: $e");
      return [];
    }
  }

  // Função que retorna todos os Profissionais que pagam para estar no Leilão
  Future<List<ParseObject>> entidadeLeilao() async {
    try {
      final listaEntidadeLeilao = ParseObject("Entidade");
      final queryEntidadeLeilao = QueryBuilder(listaEntidadeLeilao);
      queryEntidadeLeilao
        ..whereEqualTo("leilaoPago", true)
        ..orderByAscending("nome");

      // ..whereEqualTo("categoria", "value");
      final response = await queryEntidadeLeilao.query();
      if (response.success && response.results != null) {
        return response.results as List<ParseObject>;
      }
      return [];
    } catch (e) {
      Get.snackbar("Erro", "Erro ao carregar as Entidades: $e");
      return [];
    }
  }

  // Função que set com o valor true a variavel propostaAceite no back4app na class PropostaLeilao
  // Habilitando assim este Profissional para fornecer o serviço
  Future<void> aceitaPropostaLeilao(String objectId) async {
    final aceitaProposta = ParseObject("PropostaLeilao")
      ..set("propostaAceite", true)
      ..objectId = objectId;
    await aceitaProposta.save();
  }

  // Função que retorna todas as Propostas de Leilão da class PropostaLeilao
  Future<List<ParseObject>> propostaLeilao() async {
    final response = await QueryBuilder(ParseObject("PropostaLeilao")).query();
    if (response.success && response.results != null) {
      response.results as List<ParseObject>;
    }
    return [];
  }

  Future<List<ParseObject>> entidadeListaPropostaLeilao(
      String objectIdEntidade) async {
    final query = QueryBuilder(ParseObject("PropostaLeilao"))
      ..includeObject(["leilao", "leilao.cliente"])
      ..whereEqualTo(
          "entidade", ParseObject("Entidade")..objectId = objectIdEntidade);
    final response = await query.query();
    if (response.results != null && response.success) {
      return response.results! as List<ParseObject>;
    }
    return [];
  }

  @override
  void onInit() async {
    super.onInit();
  }
}
