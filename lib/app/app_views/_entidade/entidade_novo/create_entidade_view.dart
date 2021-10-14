import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinonline/app/app_controller/_entidade/entidade_novo/create_entidade_controller.dart';
import 'package:pinonline/app/app_function_global/function_global.dart';

class CreateEntidadeView extends StatefulWidget {
  @override
  _CreateEntidadeViewState createState() => _CreateEntidadeViewState();
}

class _CreateEntidadeViewState extends State<CreateEntidadeView> {
  CreateEntidadeController get _controller => CreateEntidadeController.controller;
  Widget build(BuildContext context) {
    
    final alturaTotal = MediaQuery.of(context).size.height;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: ListTile(
            title: Text("Criar Registo"),
            subtitle: Text("Insira os seus Dados")),
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
                height: (alturaTotal * 0.4) - (alturaTotal * 0.08),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                      
                          borderRadius: BorderRadius.circular(70)),
                      child: GestureDetector(
                        onTap: () {
                          _controller.getImage();
                        },
                        child: GetBuilder<CreateEntidadeController>(
                          init: CreateEntidadeController(),
                          builder: (_) => DottedBorder(
                            color: Colors.grey,
                                strokeWidth: 2,
                                dashPattern: [10, 10],
                                borderType: BorderType.RRect,
                                radius: Radius.circular(100),
                                padding: EdgeInsets.all(6),
                            child: CircleAvatar(
                              radius: 60,
                          backgroundColor: Colors.grey.shade300,
                              // ignore: unnecessary_null_comparison
                              child: _controller.imageSelected
                                  ? ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(100)),
                                      child: Stack(
                                        children: [
                                          Center(
                                            child: CircularProgressIndicator()
                                          ),
                                          Image.file(
                                            _controller.image!,
                                            width: double.infinity,
                                            height: double.infinity,
                                          ),
                                        ],
                                      ),
                                    )
                                  : Center(
                                      child: Text(
                                        "Inserir Logo",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Conta de Profissional",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.transparent,
                height: (alturaTotal * 0.6) - (alturaTotal * 0.08),
                child: Form(
                  key: _controller.form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Nome de Usuário",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: _controller.nome,
                        keyboardType: TextInputType.name,
                        validator: (v) {
                          if (v == "" || v == null) {
                            return "Preencha o campo com o seu nome";
                          } else if (v.length <= 3) {
                            return "Nome muito curto";
                          }
                        },
                        decoration: InputDecoration(
                            hintText: 'Nome de Usuario',
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Email",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: _controller.email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: 'Email', border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Senha",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      GetBuilder<CreateEntidadeController>(
                        init: CreateEntidadeController(),
                        builder:(_)=> TextFormField(
                          controller: _controller.senha,
                          obscuringCharacter: "*",
                          obscureText:
                              !_controller.mostraSenha,
                          validator: (v) {
                            if (!containLetter(v)) {
                              return "Senha deve conter letra!";
                            } else if (!containNumber(v)) {
                              return "Senha deve conter número!";
                            } else if (v!.length <= 5) {
                              return "Senha não pode ter menos de 5 caracteres";
                            }
                          },
                          decoration: InputDecoration(
                            hintText: 'Senha',
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.panorama_fish_eye_outlined),
                              onPressed: _controller.toggleMostraSenha,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green)),
                          onPressed: () => _controller
                              .saveEntidadeName(),
                          child: Text("Continuar"))
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
