import 'package:get/get.dart';
import '../app_models/categorias_model.dart';

class HomeController extends GetxController{
  List<Categoria> categoria = [
    Categoria(nome: "Canalizador", url: "Endereço da Imagem", desc: "Descrição da Categoria"),
    Categoria(nome: "Eletricista", url: "Endereço da Imagem", desc: "Descrição da Categoria"),
    Categoria(nome: "Carpinteiro", url: "Endereço da Imagem", desc: "Descrição da Categoria"),
    Categoria(nome: "Pintor", url: "Endereço da Imagem", desc: "Descrição da Categoria"),
    Categoria(nome: "Limpeza", url: "Endereço da Imagem", desc: "Descrição da Categoria"),
    Categoria(nome: "Serralheiro", url: "Endereço da Imagem", desc: "Descrição da Categoria")
  ];

 
}