import 'package:flutter/material.dart';

class SerralheiroView extends StatelessWidget {
  const SerralheiroView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
          
            Center(
              child: Text("Serralheiro View",
              style: TextStyle(
                fontSize: 40, 
                fontWeight: FontWeight.bold, 
                color: Colors.black45)),
            ),
          ],)
        
      ),
    );
  }
}