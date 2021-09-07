import 'package:get/get.dart';
import 'package:pinonline/app/app_controller/_cliente/cliente_login_controller.dart';
import 'package:pinonline/app/app_models/obra_model.dart';
import 'package:pinonline/app/app_provider/provider_data.dart';

class ClienteDashBoardController extends GetxController {
  static final controller = Get.put(ClienteDashBoardController());

  var _obraListaSrc = ProviderData.obraLista;
  final cliente = ClienteLoginController.controller.cliente;

  List<ObraModel> obraLista = [];

  // Função Privada que retorna uma lista de obras registadas!
  List<ObraModel> _obraLista() {
    // Variavel Lista de Obra privada
    List<ObraModel> _foundObra = [];

    // Função que verifica os usuarios de uma Obra e retorna os dados na variavel "_foundObra"
    _obraListaSrc.forEach((element) {
      if (
        element.orcamento.cliente.email == cliente[0].email &&
          element.orcamento.cliente.senha == cliente[0].senha
          
          ) {
        _foundObra.add(element);
      }
    });

    // Se for encontrado mais de 1 uma obra retorna a lista de obras se não retorna uma lista vazia
    return _foundObra.length > 0 ? _foundObra : [];
  }

// 
  List<ObraModel> clientePedidoEnviado = [];
  List<ObraModel> _clientePedidoEnviado(){
    List<ObraModel> _foundObra = [];
    obraLista.forEach((element) { 
      if (element.clienteDone == false && element.entidadeDone == false){
        _foundObra.add(element);
        
      }
    });

    return _foundObra;
  }

  // Variavel com todos os pedidos recibos;
List<ObraModel> clientePedidoRecibo = [];
  List<ObraModel> _clientePedidoRecibo(){
    List<ObraModel> _foundObra = [];
    obraLista.forEach((element) { 
      if (element.clienteDone == true && element.entidadeDone == true){
        _foundObra.add(element);
      }
    });

    return _foundObra;
  }

  //######################################
List<ObraModel> clientePedidoAceitado = [];
  List<ObraModel> _clientePedidoAceitado(){
    List<ObraModel> _foundObra = [];
    obraLista.forEach((element) { 
      if (element.clienteDone == false && element.entidadeDone == true){
        _foundObra.add(element);
      }
    });

    return _foundObra;
  }
  //######################################


  //Função que actualiza os dados do DashBoard 
  //OBS: Deve ser chamada antes de retornar a tela do app
  void dashBoardFresh() {
    
    obraLista.clear();
    obraLista = _obraLista();

    clientePedidoEnviado.clear();
    clientePedidoEnviado = _clientePedidoEnviado();

    clientePedidoAceitado.clear();
    clientePedidoAceitado = _clientePedidoAceitado();
    
    clientePedidoRecibo.clear();
    clientePedidoRecibo = _clientePedidoRecibo();
  }
}
