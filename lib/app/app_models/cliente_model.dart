class ClienteModel {
  final String nome;
  final String senha;
  final String email;
  final String morada;
  final String contacto;
  final String img;
  final String desc;
  final String objectId;
  
  ClienteModel(
      {required this.nome,
      required this.senha,
      required this.img,
      required this.email,
      required this.morada,
      required this.contacto,
      required this.desc,
      required this.objectId,
      });

  String clientePrimeiroNome() {
    var _totalLetra = nome.length;
    var _primeiroNomeFind = '';

    for (var c = 0; c <= (_totalLetra - 1); c++) {
      if (nome[c] != ' ') {
        _primeiroNomeFind = _primeiroNomeFind + nome[c];
      } else {
        break;
      }
    }
    return _primeiroNomeFind;
  }

  String clienteUltimoNome() {
    var _totalLetra = nome.length;
    var _ultimoNomeFind = '';

    for (var c = _totalLetra - 1; c >= 0; c--) {
      if (nome[c] != ' ') {
        _ultimoNomeFind = _ultimoNomeFind + nome[c];
      } else {
        break;
      }
    }
    var novoNome = '';
    for (var c = (_ultimoNomeFind.length - 1); c >= 0; c--) {
      novoNome = novoNome + _ultimoNomeFind[c];
    }
    return novoNome;
  }

}

