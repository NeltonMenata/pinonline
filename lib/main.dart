import 'package:flutter/material.dart';
import 'app/app_views/app_routes/routes.dart';
import 'package:get/get.dart';

void main() {
  
  /*
  final keyApplicationId = "";
  final keyClientKey = "";
  final keyParseServerUrl = "http://parseapi.back4app.com";
  ProviderData();
  await Parse().initialize(keyApplicationId, keyParseServerUrl, clientKey: keyClientKey, autoSendSessionId: true);

  final data = ParseObject('categoria',)..set("chave", "{profissao : canalizador}");
  await data.save();
  File file = File("");
  final parseFile = ParseFile(file,);
  final gallery = ParseObject("categoria")
    ..set("parseFile", parseFile);
    await gallery.save();
  */
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pinonline',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(),
        primaryIconTheme: IconThemeData.fallback(),
        primarySwatch: Colors.lightBlue,
      ),
      initialRoute: Routes.STARTAPP,
      getPages: Routes.routes,
    );
  }
}
