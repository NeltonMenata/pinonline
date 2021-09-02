import 'orcamento_model.dart';
import 'entidade_model.dart';

class ObraModel {
  final EntidadeModel entidade;
  final OrcamentoModel orcamento;

  bool clienteDone;
  bool entidadeDone;

  var _valorPago = 0.0;
  var _valorInicial = 0.0;
  var _dataInicial = DateTime(2021, 12, 19);

  ObraModel({
    required this.orcamento,
    required this.entidade,
    required this.clienteDone,
    required this.entidadeDone,
  });

  pagarObra(double valor) {
    _valorPago = _valorPago + valor;
  }

  get valorInicial => _valorInicial;
  get dataInicial => _dataInicial;
}
