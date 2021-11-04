import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class PagamentoClienteController extends GetxController {
  static final controller = Get.put(PagamentoClienteController());

  Future<List<ParseObject>> listaPagamento() async {
    try {
      final queryPagamento = QueryBuilder(ParseObject("Pagamento"))
        ..includeObject(["cliente", "leilao"]);
      final response = await queryPagamento.query();
      if (response.success && response.results != null) {
        return response.results as List<ParseObject>;
      }
      return [];
    } catch (e) {
      Get.snackbar("Erro", "Verifica a conexão com a internet: $e");
      return [];
    }
  }

  Future<void> aceitarComprovativo(BuildContext context, String objectIdPagamento) async {
	try{
		showDialog(
		context: context,
		builder:(context)=>AlertDialog(
			title: Text("Comprovativo"),
			content: Text("Aceitar o comprovativo de pagamento?"),
			actions:[
				TextButton(child: Text("Sim"), onPressed:() async {
					final pagamento = ParseObject("Pagamento")
					..set("isDone", true)
					..objectId = objectIdPagamento;
					await pagamento.save();
					Get.back();
					Get.snackbar("Sucesso","Comprovativo aceite com sucesso", backgroundColor: Colors.green.withOpacity(0.5));
				}),
				TextButton(child: Text("Não"), onPressed:(){
					Get.back();
				})
			]
		)
		);
	}catch(e){
		Get.snackbar("Erro","Mensagem de erro: $e");
	}
  }
}
