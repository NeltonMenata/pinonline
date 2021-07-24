import 'package:get/get.dart';
// ignore: unused_import
import 'package:pinonline/app/app_provider/provider_data.dart';
// ignore: unused_import
import '../app_models/categorias_model.dart';

class HomeController extends GetxController {

  static HomeController controller = Get.put(HomeController());
  
  // Cria uma lista privada de categoria e recebe os dados do Provedor!
  List<Categoria> _categoria = ProviderData.categoriaAll;

  // Get que pega os Dados da lista de _categoria privada!
  List<Categoria> get categoriaAll => _categoria;

  // Get que pega o total de itens dentro da _categoria privada!
  int get totalCategoria => _categoria.length;

  // Cria uma lista vazia para receber posteriormente os itens procurados!
  List<Categoria> foundCategoria = [];

  // String get _value => " algo ";

  // Função para procurar itens na Categoria e retornar todos encontrados na lista de foundCategoria!
  procurar(String value) {
    foundCategoria = [];
    value.toLowerCase();
    this.categoriaAll.forEach((element) {
      if (element.nome.toLowerCase().contains(value.toLowerCase())) {
        print(element.nome);
        foundCategoria.add(element);
      }
    });
    print("Procurando");
    update();
  }



}
