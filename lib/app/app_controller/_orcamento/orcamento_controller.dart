import 'package:get/get.dart';
import 'package:pinonline/app/app_controller/_obra/obra_save_controller.dart';
import 'package:pinonline/app/app_models/obra_model.dart';
import 'package:pinonline/app/app_models/orcamento_model.dart';
import 'package:pinonline/app/app_provider/provider_data.dart';
import 'package:pinonline/app/app_views/_obra/obra_save_view.dart';

class OrcamentoController extends GetxController {
  static final controller = Get.put(OrcamentoController());

  var entidade = ProviderData.entidadeLista;

  static final List<OrcamentoModel> orcamento = [];

  //Função que escolhe a Entidade de Prestação de Serviço
  // e adiciona está entidade junto do orçamento na variavel static do Controller ObraSaveController
  void changeEntidade(int _index) {
    
    Get.to(ObraSaveView());
    // Função que limpa todos os registros de Obras
    ObraSaveController.obra.clear();
    
    // Função que adiciona um novo registro de obra
    ObraSaveController.obra.add(ObraModel(
      orcamento: orcamento[0],
      entidade: entidade[_index],
    ));
    
    
  }
}
