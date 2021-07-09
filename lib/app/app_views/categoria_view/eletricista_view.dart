import 'package:flutter/material.dart';

class EletricistaView extends StatelessWidget {
  const EletricistaView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
          
            Center(
              child: Text("Eletricista View",
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