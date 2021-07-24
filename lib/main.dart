import 'package:flutter/material.dart';
import 'package:pinonline/app/app_provider/provider_data.dart';
import 'app/app_views/app_routes/routes.dart';
import 'package:get/get.dart';

void main() {
  ProviderData();
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
