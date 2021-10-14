import 'package:flutter/material.dart';

class AdminVew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          ListTile(
            leading:CircleAvatar(),
            title: Text("Listar pedidos de leilões de Clientes"),
            onTap: (){

            },
          ),
          ListTile(
            leading: CircleAvatar(),
            title: Text("Listar respostas de leilões de Profissionais"),
            onTap: (){

            },
          )
        ],
      ),
    ));
  }
}
