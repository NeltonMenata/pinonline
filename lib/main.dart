import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'app/app_provider/provider_data.dart';
import 'app/app_views/app_routes/routes.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final keyApplicationId = "OsiPUlfwC4Av3KtTAlxO5HssYxdeH9g8OrgSBxGu";
  final keyClientKey = "uDLx5YOIKES5TUXuzTUt8WAM4jgwOq5QjF3wAiIP";
  final keyParseServerUrl = "https://parseapi.back4app.com";
  ProviderData();
  await Parse().initialize(keyApplicationId, keyParseServerUrl, clientKey: keyClientKey, autoSendSessionId: true);
  
  print("Conexao feita com sucesso");
  
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
