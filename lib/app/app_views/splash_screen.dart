import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:pinonline/app/app_views/_welcome/welcome_alternative_view.dart';
class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset("assets/img/logotipo.png"),
      logoSize: 170,
      navigator: WelcomeAlternativeView(), //  WelcomeView(),
      durationInSeconds: 3,
      showLoader: true,
      loaderColor: Colors.lightGreen,
      loadingText: Text("Carregando"),
      backgroundColor: Colors.grey.shade500,
      
    );
  }
}


