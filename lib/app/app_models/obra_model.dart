import 'orcamento_model.dart';
import 'entidade_model.dart';

class ObraModel {
  final EntidadeModel entidade;
  final OrcamentoModel orcamento;

  bool _clienteDone = false;
  bool _entidadeDone = false;

  var _valorPago = 0.0;
  var _valorDivida = 0.0;
  var _valorObra = 0.0;
  var _dataInicial = DateTime(2021, 12, 19);

  ObraModel({
    required this.orcamento,
    required this.entidade,
  });
  double get divida => _valorDivida;
  void pagarObra(double valor) {
    _valorPago = _valorPago + valor;
  }

  void clienteDoneYes(){
    _clienteDone = true;
  }
  void entidadeDoneYes(){
    _entidadeDone = true;
  }
  get valorInicial => _valorObra;
  get dataInicial => _dataInicial;

  bool get clienteDone => _clienteDone;
  bool get entidadeDone => _entidadeDone;

}
