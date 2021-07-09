import 'package:flutter/material.dart';
import 'app/app_views/app_routes/routes.dart';
import 'package:get/get.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      
      theme: ThemeData(
        primaryIconTheme: IconThemeData.fallback(),
        primarySwatch: Colors.lightGreen,
      ),
      initialRoute: "/",
      getPages: Routes.routes,
    );
  }
}

