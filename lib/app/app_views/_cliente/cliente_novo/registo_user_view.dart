import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_controller/_cliente/cliente_novo/create_user_controller.dart';

// ignore: must_be_immutable
class RegistoUserView extends StatelessWidget {
  CreateUserController get _controller => CreateUserController.controller;
  Widget build(BuildContext context) {
    //final larguraTotal = MediaQuery.of(context).size.width;
    final alturaTotal = MediaQuery.of(context).size.height;
    //final controller = Get.put(AnimationController(largura: largura * 0.9, altura: altura * 0.8));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: ListTile(
            title: Text("Dados da Empresa"),
            subtitle: Text("Insira os Dados de sua entidade")),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 20, left: 25, right: 25),
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.white),
          child: ListView(
            children: [
              Container(
                color: Colors.transparent,
                height: (alturaTotal * 0.85),
                child: Form(
                  key: _controller.formRegisto,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Telefone",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: _controller.telefone,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            hintText: 'Telefone',
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Morada",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: _controller.morada,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: 'Morada', border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Cidade",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextFormField(
                        controller: _controller.cidade,
                        decoration: InputDecoration(
                            hintText: 'Cidade', border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Descrição",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextFormField(
                        controller: _controller.desc,
                        decoration: InputDecoration(
                            hintText: 'Descrição',
                            border: OutlineInputBorder()),
                      ),
                      Spacer(),
                      Obx((){
                        return Visibility(
                          visible: _controller.isSave.value,
                          child: Center(child: CircularProgressIndicator(),),);}
                      ),
                      Spacer(),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green)),
                          onPressed: ()=>
                              _controller.saveUser(context),
                          child: Text("Salvar Entidade")),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.grey)),
                          onPressed: () {
                            Get.back();
                          },
                          child: Text("Ignorar")),
                          
                    ],
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

