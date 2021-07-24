import 'package:flutter/material.dart';

PreferredSizeWidget appBarMain() {
  return AppBar(
    centerTitle: true,
    title: Text("JustBuild"),
    actions: [
      Image.asset(
        "assets/img/logo.png",
        width: 70,
      )
    ],
    foregroundColor: Colors.green,
  );
}

PreferredSizeWidget appBarSearch() {
  return AppBar(
    centerTitle: true,
    title: Text(
      "Resultado da Pesquisa",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    actions: [
      Image.asset(
        "assets/img/logo.png",
        width: 70,
      )
    ],
    foregroundColor: Colors.green,
  );
}
