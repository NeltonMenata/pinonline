import 'package:get/get.dart';
import 'package:pinonline/app/app_provider/provider_data.dart';
import '../app_models/categorias_model.dart';

class DeleteController extends GetxController {
  static final DeleteController controller = Get.put(DeleteController());

  // Cria uma lista privada de categoria e recebe os dados do Provedor!
  List<Categoria> _categoria = ProviderData.categoriaAll;

  // Get que pega os Dados da lista de _categoria privada!
  List<Categoria> get dcategoriaAll => _categoria;

  // Get que pega o total de itens dentro da _categoria privada!
  int get dtotalCategoria => _categoria.length;

  // Variavel que seleciona todos
  bool isSelected = false;

  // Função que recebe o identificador do
  //objecto da lista por parametro e
  //atribui um novo valor
  //para variavel selected!
  void toggleSelection(int id) {
    _categoria[id].selected = !_categoria[id].selected;
    update();
  }
  //fim de citação

  // Seleciona todos os objectos da tela!
  void toggleSelectionAll() {
    for (int c = 0; c < _categoria.length; c++) {
      _categoria[c].selected = !isSelected;
    }
    update();
  }
  // fim de citação

  // Função que apaga todo elemento da
  //categoria que tiver a propriedade selected = true!
  void removeCategoria() {
    ProviderData.categoriaAll
        .removeWhere((element) => element.selected == true);
    update();
  }
  //fim de citação

}
