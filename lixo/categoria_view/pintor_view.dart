import 'package:flutter/material.dart';

class PintorView extends StatelessWidget {
  const PintorView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
          
            Center(
              child: Text("Pintor View",
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