import 'package:flutter/material.dart';
import 'package:pinonline/app/app_views/home_view.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
  }
}