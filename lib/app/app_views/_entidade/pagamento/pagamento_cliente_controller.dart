import 'package:get/get.dart';
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

  Future<void> aceitarComprovativo(String objectIdPagamento) async {

  }
}
