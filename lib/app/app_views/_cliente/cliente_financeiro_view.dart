import 'package:flutter/material.dart';
import 'package:pinonline/app/app_views/app_components/home_components/app_bottom_bar.dart';

class ClienteFinanceiroView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[500],
        title: Text("Financeiro"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Financeiro",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Text(
                "Carterira",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey.shade600),
              ),
            ),
            
            Spacer(),
            Table(
              defaultColumnWidth: FixedColumnWidth(150.0),
              border: TableBorder(
                horizontalInside: BorderSide(
                  color: Colors.black,
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
                verticalInside: BorderSide(
                  color: Colors.black,
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
              ),
              children: [
                _criarLinhaTable("Estado, Empresa, Editar"),
                _criarLinhaTable(", , "),
                _criarLinhaTable(" ,  ,  "),
                _criarLinhaTable(" ,  ,  "),
                _criarLinhaTable(" ,  ,  "),
              ],
            ),
            Spacer(),
            Spacer(),
            Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: bottomAppBar(),
    );
  }

  _criarLinhaTable(String listaNomes) {
    return TableRow(
      children: listaNomes.split(',').map((name) {
        return Container(
          alignment: Alignment.center,
          child: Text(
            name,
            style: TextStyle(fontSize: 20.0),
          ),
          padding: EdgeInsets.all(8.0),
        );
      }).toList(),
    );
  }
}
