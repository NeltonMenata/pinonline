import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class PagamentoController extends GetxController {
  static final controller = Get.put(PagamentoController());

  File? file;
  var isSend = false;
  var isDone = false.obs;
  TextEditingController valor = TextEditingController();
  TextEditingController desc = TextEditingController();

  void carregarImagem() async {
    file = null;
    sendProgressIndicator(false);
    ImagePicker imagePicker = ImagePicker();
    XFile? xfile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (xfile != null) {
      file = File(xfile.path);
      isDone.value = true;
    }
  }

  void sendProgressIndicator(bool value){
    isSend = value;
    update();
  }

  //Função que retorna a lista de Obra que o Cliente Solicitou
  // Função que retorina Lista de todos os pedidos de Leilão
  Future<List<ParseObject>> listaLeilao(String objectIdCliente) async {
    try {
      final queryLeilao = QueryBuilder(ParseObject("Leilao"))
        ..includeObject(["cliente"])
        ..whereEqualTo(
            "cliente", ParseObject("Cliente")..objectId = objectIdCliente);
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
      sendProgressIndicator(true);
      ParseFileBase parseFile;
      parseFile = ParseFile(file);
      await parseFile.save();

      final pagamento = ParseObject("Pagamento");
      pagamento
        ..set("comprovativo", parseFile)
        ..set("valor", double.parse(valor.text))
        ..set("descricao", desc.text)
        ..set("isDone", false)
        ..set("cliente", ParseObject("Cliente")..objectId = objectIdCliente)
        ..set("leilao", ParseObject("Leilao")..objectId = objectIdLeilao);
      await pagamento.save();
      sendProgressIndicator(false);
      file = null;
      valor.text = "";
      desc.text = "";
      Get.back();
      Get.snackbar("Sucesso", "Comprovativo de Pagamento enviado com sucesso",
          backgroundColor: Colors.green.withOpacity(0.5));
      
    } catch (e) {
      sendProgressIndicator(false);
      Get.snackbar("Erro de Conexão",
          "Erro ao salvar. Verifique a sua conexão com a internet! \nErro: $e", backgroundColor: Colors.red.withOpacity(0.5));
      return;
    }
  }

  Future<List<ParseObject>> listaPagamento(String objectIdLeilao) async {
    try {
      final queryPagamento = QueryBuilder(ParseObject("Pagamento"))
        ..includeObject(["leilao"])
        ..whereEqualTo(
            "leilao", ParseObject("Leilao")..objectId = objectIdLeilao);
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
