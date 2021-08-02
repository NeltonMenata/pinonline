import 'package:get/get.dart';
import '/app/app_provider/provider_data.dart';
import '../app_models/categorias_model.dart';

class HomeController extends GetxController {

  static HomeController controller = Get.put(HomeController());
  
  atualizaHome(){
    categoria = ProviderData.categoriaAll;
    update();
  }
  var categoria = ProviderData.categoriaAll;

  // Get que pega o total de itens dentro da _categoria privada!
  get totalCategoria => categoria.length;

  // Cria uma lista vazia para receber posteriormente os itens procurados!
  List<Categoria> foundCategoria = [];

  // Função para procurar itens na Categoria e retornar todos encontrados na lista de foundCategoria!
  procurar(String value) {
    foundCategoria = [];
    value.toLowerCase();
    this.categoria.forEach((element) {
      if (element.nome.toLowerCase().contains(value.toLowerCase())) {
        print(element.nome);
        foundCategoria.add(element);
      }
    });
    print("Procurando");
    update();
  }

}