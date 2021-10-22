import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:pinonline/app/app_controller/_cliente/cliente_login_controller.dart';
import 'package:pinonline/app/app_models/cliente_model.dart';
import 'package:pinonline/app/app_views/_size/size.dart';
import 'package:pinonline/app/app_views/app_components/home_components/app_bottom_bar.dart';

// ignore: must_be_immutable
class LeilaoClienteView extends StatelessWidget {
  ControllerLeilao get _controller => ControllerLeilao.controller;

  ClienteModel get cliente => ClienteLoginController.controller.cliente[0];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  height: alturaPor(20, context),
                  width: double.infinity,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(larguraPor(15.5, context)),
                        child: CircleAvatar(
                            backgroundColor: Colors.green,
                            radius: larguraPor(15, context),
                            child: Stack(
                              children: [
                                Center(child: CircularProgressIndicator()),
                                Image.network(
                                  cliente.img,
                                  width: double.infinity,
                                  height: double.infinity,
                                  errorBuilder: (_, __, ___) {
                                    return Center(
                                      child: Container(
                                        color: Colors.green,
                                        height: 100,
                                        width: 100,
                                        child: Center(
                                          child: Text(
                                            "Erro ao carregar a imagem",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Obx(
                            () => Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: _controller.isDocSelect.value
                                      ? Colors.green
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all()),
                              child: TextButton.icon(
                                  label: Text("Carregar um documento PDF"),
                                  onPressed: () {
                                    _controller.selectFile();
                                  },
                                  icon: Icon(_controller.isDocSelect.value
                                      ? Icons.file_download_done
                                      : Icons.file_download)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text("Nome",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(cliente.nome),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text("Email",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(cliente.email),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text("Telemóvel",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(cliente.contacto),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text("Localização da Obra",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextField(
                                  controller: _controller.localizacao,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder())),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text("Descreva o Assunto da tua obra",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextField(
                                  controller: _controller.desc,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder())),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text("Digite o limite de pagamento da obra",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextField(
                                  controller: _controller.valorMax,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder())),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green[500]),
                          ),
                          onPressed: () {
                            Get.back();
                          },
                          child: Text("Voltar")),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green[500]),
                          ),
                          onPressed: ()=>_controller.saveLeilao(context),
                          child: Text("Enviar Leilão")),
                    ],
                  ),
                ),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Obx(
              ()=> Visibility(
                visible: _controller.isSave.value,
                child: CircularProgressIndicator()),
            ),
          ),
          bottomNavigationBar: bottomAppBar(),
        ),
      ),
    );
  }
}

class ControllerLeilao extends GetxController {
  static final controller = Get.put(ControllerLeilao());

  get cliente => ClienteLoginController.controller.cliente[0];
  TextEditingController desc = TextEditingController();
  TextEditingController localizacao = TextEditingController();
  TextEditingController valorMax = TextEditingController();
  var isDocSelect = false.obs;
  File? doc;
  var isSave = false.obs;

  Future<void> selectFile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ["pdf"]);
    if (result == null) return;
    print(result.files.first.path);
    doc = File(result.files.first.path!);
    print(doc);
    isDocSelect.value = true;
  }

  void saveLeilao(BuildContext context) async {
    if (doc == null || isDocSelect.value != true) {
      Get.snackbar("Documento", "Seleciona um documento do tipo PDF");
      return;
    }
    isSave.value = true;
    try {
      
      ParseFileBase parseFile;
      parseFile = ParseFile(doc);
      await parseFile.save();
      final leilao = ParseObject("Leilao")
        ..set("cliente", ParseObject("Cliente")..objectId = cliente.objectId)
        ..set("localizacao", controller.localizacao.text.toString())
        ..set("descricao", controller.desc.text.toString())
        ..set("valorMax", int.parse(controller.valorMax.text.toString()))
        ..set("documento", parseFile);
      await leilao.save();
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text("Leilão Enviado"),
              content: Text("O seu leilão foi enviado com sucesso"),
              actions: [
                TextButton(
                    onPressed: () {
                      Get.back();
                      Get.back();
                    },
                    child: Text("Ok"))
              ],
            );
          });
          isSave.value = false;
    } catch (e) {
      print("Erro ao salvar o leilao: $e");
    }
  }

  Future<List<ParseObject>> clienteLeilaoResponse(String objectIdCliente) async {
    try{
      List<ParseObject> propostaleilaoResponse = [];
      final queryLeilao = QueryBuilder(ParseObject("Leilao"))..whereEqualTo("cliente",ParseObject("Cliente")..objectId = objectIdCliente);
      final response = await queryLeilao.query();
      List<String> objectIdLeilao = [];
      response.results!.forEach((element){
        objectIdLeilao.add(element["objectId"].toString());
      });      

      objectIdLeilao.forEach((element) async {
        final queryPropostaLeilao = QueryBuilder(ParseObject("PropostaLeilao"))..includeObject(["leilao, entidade"])..whereEqualTo("leilao", ParseObject("Leilao")..objectId = element);

        final response = await queryPropostaLeilao.query();
        propostaleilaoResponse.add(response.results![0]);
      }); 
      
      return propostaleilaoResponse;
      
    }catch(e){
      Get.snackbar("Erro", "Mensagem do erro: $e");
      return [];
    }
  }
}
