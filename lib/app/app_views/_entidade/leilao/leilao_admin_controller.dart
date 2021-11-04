import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pinonline/app/app_models/entidade_model.dart';
import 'package:pinonline/app/app_models/leilao_cliente_model.dart';

class LeilaoAdminController extends GetxController {
  static final controller = Get.put(LeilaoAdminController());

  LeilaoClienteModel? leilao;
  final List<EntidadeModel>? entidade = [];
  var valorProposta = TextEditingController();
  // Variavel que seleciona todos
  bool isSelected = false;

  // Variavel que verifica se está enviando proposta
  var isSend = false;

  toggleSelectEntidade(bool value, int index) {
    entidade![index].isSelected = value;
    update();
  }

  void sendProgressIndicator(bool value) {
    isSend = value;
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
    try {
      final entidades = QueryBuilder(ParseObject("Entidade"));
      final response = await entidades.query();
      response.results!.forEach((element) {
        entidade!.add(EntidadeModel(
            nome: element["nome"],
            senha: element["senha"],
            categoria: element["categoria"].toString(),
            contacto: element["contacto"].toString(),
            email: element["email"],
            morada: element["morada"].toString(),
            desc: element["descricao"].toString(),
            img: element["img"]["url"],
            objectId: element["objectId"],
            admin: element["admin"],
            isSelected: element["isSelected"]));
      });

      entidade!.forEach((element) {
        _funtionEntidade(element, objectIdLeilao);
      });
      this.sendProgressIndicator(false);
    } catch (e) {
      Get.snackbar("Erro", "Mensagem: $e");
    }
  }

  // Função que retorina Lista de todos os pedidos de Leilão
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
      final queryEntidadeLeilao = QueryBuilder(ParseObject("Entidade"));
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

  Future<void> _funtionEntidade(
      EntidadeModel element, String objectIdLeilao) async {
    final query = QueryBuilder(ParseObject("PropostaLeilao"))
      ..whereEqualTo("entidade",
          (ParseObject("Entidade")..objectId = element.objectId).toPointer())
      ..whereEqualTo("leilao",
          (ParseObject("Leilao")..objectId = objectIdLeilao).toPointer());
    final response = await query.query();

    if (response.results != null) {
      Get.snackbar("Proposta Leilão",
          "O usuário ${element.nome} já recebeu essa proposta de leilão");
      return;
    }

    final propostaLeilao = ParseObject("PropostaLeilao")
      ..set("entidade", ParseObject("Entidade")..objectId = element.objectId)
      ..set("leilao", ParseObject("Leilao")..objectId = objectIdLeilao)
      ..set("propostaAceite", false);
    await propostaLeilao.save();
    Get.snackbar(
        "Proposta de Leilão", "A proposta leilão foi enviada com sucesso");
  }

  // Função que set com o valor true a variavel propostaAceite no back4app na class PropostaLeilao
  // Habilitando assim este Profissional para fornecer o serviço
  Future<void> aceitaPropostaLeilao(
      String objectIdProposta, String objectIdLeilao) async {
    try {
      final qLeilaoIsDone = QueryBuilder(ParseObject("PropostaLeilao"))
        ..whereEqualTo(
            "leilao", ParseObject("Leilao")..objectId = objectIdLeilao)
        ..whereEqualTo("propostaAceite", true);
      final response = await qLeilaoIsDone.query();
      if(response.results != null && response.success){
        Get.snackbar("Proposta de Leilao", "Este Leilão já foi atribuído a outro Profissional", backgroundColor: Colors.red.withOpacity(0.5));
        return;
      }

      final aceitaProposta = ParseObject("PropostaLeilao")
        ..set("propostaAceite", true)
        ..objectId = objectIdProposta;
      await aceitaProposta.save();
      Get.snackbar("Proposta Leilão", "Proposta foi atribuida ao Profissional com sucesso", backgroundColor: Colors.green.withOpacity(0.5));
    } catch (e) {
      Get.snackbar("Erro", "Mensagem: $e");
    }
  }

  // Função que retorna todas as Propostas de Leilão da class PropostaLeilao
  Future<List<ParseObject>> propostaLeilao() async {
    try {
      final response =
          await QueryBuilder(ParseObject("PropostaLeilao")).query();
      if (response.success && response.results != null) {
        return response.results as List<ParseObject>;
      }
      return [];
    } catch (e) {
      Get.snackbar("Erro", "Mensagem: $e");
      return [];
    }
  }

  // Função que retorna uma lista de Proposta de Leilão
  // recebe o objectId da Entidade e retorna todas Propostas de Leilão
  // onde é igual ao objectId da Entidade
  Future<List<ParseObject>> entidadeListaPropostaLeilao(
      String objectIdEntidade) async {
    try {
      final query = QueryBuilder(ParseObject("PropostaLeilao"))
        ..includeObject(["leilao", "leilao.cliente"])
        ..whereEqualTo(
            "entidade", ParseObject("Entidade")..objectId = objectIdEntidade);
      final response = await query.query();
      if (response.results != null && response.success) {
        return response.results! as List<ParseObject>;
      }
      return [];
    } catch (e) {
      Get.snackbar("Erro", "Mensagem: $e");
      return [];
    }
  }

  Future<void> respostaEntidadeLeilao(
      double valorProposta, String objectIdLeilao, BuildContext context) async {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("Tem certeza"),
            content: Text("Confirme o valor antes de enviar. Continuar?"),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("Não"),
              ),
              TextButton(
                onPressed: () async {
                  try {
                    final propostaLeilao = ParseObject("PropostaLeilao")
                      ..set("clienteDone", true)
                      ..set("entidadeDone", true)
                      ..set("valorProposta", valorProposta)
                      ..objectId = objectIdLeilao;
                    await propostaLeilao.save();
                    Get.back();
                    Get.snackbar("Proposta de Leilão",
                        "Valor de propsta de Leilão enviado com sucesso",
                        backgroundColor: Colors.green);
                  } catch (e) {
                    Get.snackbar("Erro", "Mensagem: $e");
                    Get.back();
                  }
                },
                child: Text("Sim"),
              ),
            ],
          );
        });
  }

  // Função que retorna lista de todas as propostas respondidas pelo profissional
  Future<List<ParseObject>> adminLeilaoResponseEntidade(
      /*String objectIdLeilao*/) async {
    try {
      final query = QueryBuilder(ParseObject("PropostaLeilao"))
        ..includeObject(["leilao", "leilao.cliente", "entidade"])
        // ..whereEqualTo("leilao", ParseObject("Leilao")..objectId = objectIdLeilao)
        ..whereEqualTo("entidadeDone", true);
      final response = await query.query();
      if (response.results != null && response.success) {
        return response.results! as List<ParseObject>;
      }
      return [];
    } catch (e) {
      Get.snackbar("Erro", "Mensagem: $e");
      return [];
    }
  }

  var pdfLoading = false.obs;
  Future<int> loadPdfFull() async {
    pdfLoading.value = true;
    var leilao = await listaLeilao();
    leilao.forEach((element) async {
      pdfLista.add(await loadPdf(element["documento"]["url"]));
    });
    return 1;
  }

  List<String> pdfLista = [];
  int intPDF = 0;
  Future<String> loadPdf(String url) async {
    var response = await Dio().get(url,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            receiveTimeout: 0));
    var dir = await getTemporaryDirectory();
    File file = File(dir.path + "/$intPDF.pdf");
    file.openWrite();
    await file.writeAsBytes(response.data);

    intPDF++;
    return file.path;
  }

  @override
  void onInit() async {
    var finishid = await loadPdfFull();
    if (finishid != 1) return;
    pdfLoading.value = false;
    super.onInit();
  }
}
