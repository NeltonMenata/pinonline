import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Back4app{
  static Future<void> initialize() async{
    WidgetsFlutterBinding.ensureInitialized();

  final keyApplicationId = "OsiPUlfwC4Av3KtTAlxO5HssYxdeH9g8OrgSBxGu";
  final keyClientKey = "uDLx5YOIKES5TUXuzTUt8WAM4jgwOq5QjF3wAiIP";
  final keyParseServerUrl = "https://parseapi.back4app.com";

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);

  }
}