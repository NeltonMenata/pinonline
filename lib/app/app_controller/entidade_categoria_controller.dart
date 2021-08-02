import 'package:get/get.dart';
import '../app_models/entidade_model.dart';

class EntidadeController extends GetxController{
  static final entidadeController = Get.put(EntidadeController());
  var entidade = EntidadeModel.allEntidades();
  List<EntidadeModel> entidadeData = [];
  
}