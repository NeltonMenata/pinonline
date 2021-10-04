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
        colorScheme: ColorScheme.light(),
        primaryIconTheme: IconThemeData.fallback(),
        primarySwatch: Colors.lightBlue,
      ),
      initialRoute: Routes.STARTAPP,
      getPages: Routes.routes,
    );
  }
}
