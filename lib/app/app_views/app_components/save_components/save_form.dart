import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormSave extends StatelessWidget {
  //var controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 100.0, top: 30),
              child: Text(
                "Cadastrar Profissão",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        labelText: 'Nome da Categoria',
                        icon: Icon(Icons.account_circle),
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        labelText: 'Descrição',
                        icon: Icon(Icons.description),
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'url da imagem',
                        icon: Icon(Icons.image_rounded),
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(onPressed: () {
                    
                  }, child: Text("Salvar Cadastro"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
