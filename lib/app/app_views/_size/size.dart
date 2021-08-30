  import 'package:flutter/material.dart';

double alturaPor(double percentagem, BuildContext context){
    double _altura = MediaQuery.of(context).size.height * (percentagem/100);
    return _altura;
  }

  double larguraPor(double percentagem, BuildContext context){
    double _largura = MediaQuery.of(context).size.width * (percentagem/100);
    return _largura;
  }