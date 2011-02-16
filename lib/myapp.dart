import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/app_views/app_routes/routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      
      title: 'Pinonline',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(centerTitle: true),
        colorScheme: ColorScheme.light(),
        primaryIconTheme: IconThemeData.fallback(),
        primarySwatch: Colors.green,
      ),
      initialRoute: Routes.STARTAPP,
      getPages: Routes.routes,
    );
  }
}
