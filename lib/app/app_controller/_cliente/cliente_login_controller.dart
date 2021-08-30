import 'package:get/get.dart';
import 'package:pinonline/app/app_models/cliente_model.dart';
import 'package:pinonline/app/app_provider/provider_data.dart';

class ClienteLoginController extends GetxController{

static final controller = Get.put(ClienteLoginController());

List<ClienteModel> cliente = [];
String clienteLogin(String _email, String _senha){
  var clienteLista = ProviderData.clienteLista; 
  
  clienteLista.forEach((element) {
    if(element.email == _email && element.senha == _senha){
      cliente.add(element);
    }
   });

  return cliente.length == 1 ? "1" : "0";
   
}

}