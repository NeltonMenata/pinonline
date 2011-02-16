import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class PagamentoController extends GetxController {
  static final controller = Get.put(PagamentoController._());
  PagamentoController._();

  File? file;
  var isSend = false.obs;
  var isDone = false.obs;
  TextEditingController valor = TextEditingController();
  TextEditingController desc = TextEditingController();

  void carregarImagem() async {
    file = null;
    isDone.value = false;
    ImagePicker imagePicker = ImagePicker();
    XFile? xfile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (xfile != null) {
      file = File(xfile.path);
      isDone.value = true;
    }
  }

  //Função que retorna a lista de Obra que o Cliente Solicitou
  // Função que retorina Lista de todos os pedidos de Leilão
  Future<List<ParseObject>> listaLeilao(String objectIdCliente) async {
    try {
      final queryLeilao = QueryBuilder(ParseObject("Leilao"))
        ..includeObject(["cliente"])
        ..whereEqualTo("cliente", ParseObject("Cliente")..objectId = objectIdCliente);
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

  Future<void> sendPagamento(
      {required String objectIdCliente, required String objectIdLeilao}) async {
    try {
      if (valor.text.isEmpty) return;
      if (desc.text.isEmpty) return;
      if (file == null) return;

      isSend.value = true;
      ParseFileBase parseFile;
      parseFile = ParseFile(file);
      await parseFile.save();

      final pagamento = ParseObject("Pagamento");
      pagamento
        ..set("comprovativo", parseFile)
        ..set("valor", double.parse(valor.text))
        ..set("descricao", desc.text)
        ..set("cliente", ParseObject("Cliente")..objectId = objectIdCliente)
        ..set("leilao", ParseObject("Leilao")..objectId = objectIdLeilao);
        await pagamento.save();
        isSend.value = false;
        Get.snackbar("Sucesso", "Comprovativo de Pagamento enviado com sucesso");
    } catch (e) {
      isSend.value = false;
      Get.snackbar("Erro de Conexão",
          "Erro ao salvar. Verifique a sua conexão com a internet! \nErro: $e");
    }
  }

  Future<List<ParseObject>> listaPagamento(String objectIdLeilao) async {
    try {
      final queryPagamento = QueryBuilder(ParseObject("Pagamento"))
        ..includeObject(["leilao"])
        ..whereEqualTo("leilao", ParseObject("Leilao")..objectId = objectIdLeilao);
      final response = await queryPagamento.query();
      if (response.results != null && response.success) {
        return response.results as List<ParseObject>;
      }
      return [];
    } catch (e) {
      Get.snackbar("Erro", "Erro ao consultar os Pagamentos no sistema: $e");
      return [];
    }
  }
}
