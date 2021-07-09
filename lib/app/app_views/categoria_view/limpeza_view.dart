import 'package:flutter/material.dart';

class LimpezaView extends StatelessWidget {
  const LimpezaView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
          
            Center(
              child: Text("Limpeza View",
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