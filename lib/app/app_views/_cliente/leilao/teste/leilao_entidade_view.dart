import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class LeilaoEntidadeController extends GetxController {
  static final controller = Get.put(LeilaoEntidadeController());

  TextEditingController valorProposta = TextEditingController();

  // Função que retorna todas as PropostaLeilao onde o ParseObject("Entidade")..objectId = _objectId
  Future<List<ParseObject>> listaPropostaLeilao(String _objectId) async {
    final queryPropostaLeilao = QueryBuilder(ParseObject("PropostaLeilao"))
      ..whereEqualTo("entidade", ParseObject("Entidade")..objectId = _objectId);
    final response = await queryPropostaLeilao.query();
    if (response.success && response.results != null) {
      return response.results as List<ParseObject>;
    }
    return [];
  }

  Future<void> enviaValorProposta(String _objectId) async {
    final propostaLeilao = ParseObject("PropostaLeilao")
      ..set("valorProposta", int.parse(valorProposta.text.toString()))
      ..objectId = _objectId;
    await propostaLeilao.save();
  }

  // Função que retorna todas as PropostaLeilao onde ParseObject("Entidade")..objectId = _objectId
  Future<List<ParseObject>> propostaLeilao(String _objectId) async {
    try {
      final propostaLeilao = ParseObject("PropostaLeilao");
      final queryPropostaLeilao = QueryBuilder(propostaLeilao);
      queryPropostaLeilao
        ..whereEqualTo(
            "entidade", ParseObject("Entidade")..objectId = _objectId);
      final response = await queryPropostaLeilao.query();
      if (response.success && response.results != null) {
        return response.results as List<ParseObject>;
      }
      return [];
    } catch (e) {
      Get.snackbar("Erro", "Erro ao carregar as Entidades: $e");
      return [];
    }
  }

  @override
  void onInit() async {
    super.onInit();
  }
}
