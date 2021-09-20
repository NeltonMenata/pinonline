import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:pinonline/app/app_models/cliente_model.dart';
import 'package:pinonline/app/app_models/entidade_model.dart';
import 'package:pinonline/app/app_models/obra_model.dart';
import '/app/app_models/categorias_model.dart';

class ProviderData {
  static Future<List<ParseObject>> getCanalizadorData() async {
    final canalizadorObjec = ParseObject("Canalizador");

    QueryBuilder<ParseObject> queryCanalizador = QueryBuilder(canalizadorObjec);
    final responseCanalizador = await queryCanalizador.query();
    if (responseCanalizador.success && responseCanalizador.statusCode == 201) {
      return responseCanalizador.result as List<ParseObject>;
    } else {
      return [];
    }
  }

  static Future<List<ParseObject>> getEntidadeData() async {
    final entidadeObject = ParseObject("Entidade"); // Como uma tabela no MySQL

    QueryBuilder<ParseObject> query = QueryBuilder<ParseObject>(entidadeObject);

    final response = await query.query();
    if (response.results != null && response.success) {
      return response.result as List<ParseObject>;
    } else {
      return [];
    }
  }

  static Future<List<ParseObject>> getCategoriaData() async {
    final categoriaObject = ParseObject("Categoria");

    var query = QueryBuilder<ParseObject>(categoriaObject);
    
    final response = await query.query();

    if (response.results != null && response.success) {
      return response.result as List<ParseObject>;
    } else {
      return [];
    }
  }

  static List<Categoria> categoriaAll = [
    Categoria(
      nome: "Programador",
      url:
          "https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t1.6435-9/fr/cp0/e15/q65/218271205_349478283509000_3028249886665315534_n.jpg?_nc_cat=106&ccb=1-3&_nc_sid=85a577&efg=eyJpIjoibyJ9&_nc_eui2=AeF7XKRDN4AEWBmaquM9pW0POBFdOTuySng4EV05O7JKeFKbOhhm8_faPLGdGvwig4d7ieRKKh6ERumR4kUtL-kb&_nc_ohc=gjx98vzxzPcAX_OgA0R&_nc_ad=z-m&_nc_cid=1390&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=a46dfae2fcd542c917634c373c59f689&oe=611F47F0",
      desc: "Nelton Menata - Programador - Flutterista ",
      id: 0,
      selected: false,
    ),
    Categoria(
      nome: "Adilson",
      url: "assets/img/imagem.jpg",
      desc: "Cortador de Cabelo",
      id: 1,
      selected: true,
    ),
    Categoria(
      nome: "Programador",
      url: "assets/img/imagem.jpg",
      desc: "Edmar Cauvino - Programador - Flutterista ",
      id: 2,
      selected: false,
    ),
    Categoria(
      nome: "Eletricista",
      url: "assets/img/imagem.jpg",
      desc: "Descrição da Categoria",
      id: 3,
      selected: false,
    ),
    Categoria(
      nome: "Carpinteiro",
      url: "assets/img/imagem.jpg",
      desc: "Descrição da Categoria",
      id: 4,
      selected: false,
    ),
    Categoria(
      nome: "Pintor",
      url: "assets/img/imagem.jpg",
      desc: "Descrição da Categoria",
      id: 5,
      selected: false,
    ),
    Categoria(
      nome: "Limpeza",
      url: "assets/img/imagem.jpg",
      desc: "Descrição da Categoria",
      id: 6,
      selected: false,
    ),
    Categoria(
      nome: "Serralheiro",
      url: "assets/img/imagem.jpg",
      desc: "Descrição da Categoria",
      id: 7,
      selected: false,
    )
  ];

  static List<ObraModel> obraLista = [];

  // Banco de Dados de Clientes no Sistema
  static List<ClienteModel> clienteLista = [
    ClienteModel(
      nome: "Casacon",
      email: "casacon@gmail.com",
      contacto: "+244",
      morada: "Luanda",
      img: "",
      senha: "casacon",
      desc: "",
      objectId: "",
    ),
    ClienteModel(
      nome: "Kero",
      email: "kero@gmail.com",
      contacto: "+244",
      img: "",
      morada: "Malanje",
      senha: "kero",
      desc: "",
      objectId: "",
    ),
    ClienteModel(
      nome: "AngoMart",
      email: "angomart@gmail.com",
      contacto: "+244",
      morada: "Lobito",
      senha: "angomart",
      img: "",
      desc: "",
      objectId: "",
    ),
    ClienteModel(
      nome: "NCR",
      email: "ncr@gmail.com",
      contacto: "+244",
      morada: "Combatentes",
      senha: "ncr",
      desc: "",
      img: "",
      objectId: "",
    ),
    ClienteModel(
      nome: "Ende",
      email: "ende@gmail.com",
      contacto: "+244",
      img: "",
      morada: "São Paulo",
      senha: "ende",
      desc: "",
      objectId: "",
    ),
    ClienteModel(
      nome: "Epal",
      email: "epal@gmail.com",
      contacto: "+244",
      morada: "Kwanza Norte",
      senha: "epal",
      img: "",
      desc: "",
      objectId: "",
    ),
  ];

  //Banco de dados das entidades prestadoras de Serviço
  static List<EntidadeModel> entidadeLista = [
    EntidadeModel(
      nome: "ApiHit",
      email: "apihit@gmail.com",
      contacto: "+255",
      morada: "Moxico",
      senha: "apihit",
      desc: "",
      objectId: "",
      categoria: "Construção",
      
      img: "",
      
    ),
    EntidadeModel(
      nome: "Teixeira Duarte",
      email: "teixeiraduarte@gmail.com",
      contacto: "+255",
      morada: "Kinaxixi",
      senha: "teixeira",
      desc: "",
      objectId: "",
      categoria: "Pedreiro",
      
      img: "",
      
    ),
    EntidadeModel(
      nome: "Nelton Menata",
      email: "neltonmenataditec@gmail.com",
      contacto: "941 357 140",
      morada: "Luanda",
      senha: "nelton",
      desc: "",
      objectId: "",
      categoria: "Programador",
      
      img: "",
      
    ),
    EntidadeModel(
      nome: "Eduardo Miguel",
      email: "eduardomiguel@gmail.com",
      contacto: "+256",
      morada: "São Pedro da Barra",
      senha: "eduardo",
      desc: "",
      objectId: "",
      categoria: "Pedreiro",
      
      img: "",
      
    ),
  ];
}
