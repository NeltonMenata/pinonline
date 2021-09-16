import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:pinonline/app/app_views/_welcome/welcome_alternative_view.dart';
// ignore: unused_import
import 'package:pinonline/app/app_views/welcome_view.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset("assets/img/logo1.png"),
      navigator: WelcomeAlternativeView(), //  WelcomeView(),
      durationInSeconds: 3,
      showLoader: true,
      loaderColor: Colors.lightGreen,
      loadingText: Text("Carregando"),
      title: Text(
        "Pinonline \nJustBuild",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 40,
        ),
      ),
      gradientBackground: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.lightGreen,
            Colors.white,
          ]),
    );
  }
}


/*

Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Center(
              child: Image.asset("assets/img/logo.png")
            ),
            Center(
              child: Text("JustBuild",
              style: TextStyle(
                fontSize: 40, 
                fontWeight: FontWeight.bold, 
                color: Colors.black45)),
            ),
            ElevatedButton(onPressed: (){
              Get.to(HomeView());
            }, child: Text("Tela Home"))
          ],)
        
      ),
    );

*/