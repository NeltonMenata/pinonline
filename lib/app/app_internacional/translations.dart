import 'package:get/get.dart';
class Traduction extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    "pt_BR":{
      "hello":"Olá Mundo",
      "client":"Cliente"
    },
    "en_US":{
      "hello":"Hello World",
      "cliente":"Client"
    }

  };

}