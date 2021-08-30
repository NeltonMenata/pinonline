import 'cliente_model.dart';

class OrcamentoModel {
  
  final ClienteModel cliente;
  final String objectId;
  final String desc;
  bool done;
  
  OrcamentoModel({
    required this.cliente,
    required this.done,
    required this.desc,
    required this.objectId,
  });

  List<OrcamentoModel> showOrcamentos() {
    return [];
  }
}

