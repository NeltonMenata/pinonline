import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedSplashScreen extends StatefulWidget {
  const AnimatedSplashScreen({ Key? key }) : super(key: key);

  @override
  _AnimatedSplashScreenState createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen> {
  var _r = 0;
  var _g = 0;
  var _b = 0;

  var _altura = 100.0;
  var _largura = 100.0;
  // ignore: unused_element
  void _aumentarAltura(){
    _altura = _altura >= 320 ? 100.0 : _altura += 50;
    var rnd = Random();
    _largura = rnd.nextInt(150) as double;
  }
  @override
  Widget build(BuildContext context) {
     
    return AnimatedContainer(
      duration: Duration(seconds: 3),
      
      height: _altura,
      width: _largura,
      color: Color.fromARGB(0, _r, _g, _b),
    );
  }
}