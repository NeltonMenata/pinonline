import 'package:dio/dio.dart';
import '/app/app_models/categorias_model.dart';

class ProviderData{
  
  ProviderData(){
    buscaDados();
  }
  
  Dio dio = Dio();

  Future buscaDados() async {
    try{
      final response = await dio.get("path");
      if(response.statusCode == 200){
        return Categoria.fromJson(response.data);
      }
      
    }catch(e){
      print(e.toString());
    }
  }

  static List<Categoria> categoriaAll = [
    Categoria(
      nome: "Programador",
      url: "https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t1.6435-9/fr/cp0/e15/q65/218271205_349478283509000_3028249886665315534_n.jpg?_nc_cat=106&ccb=1-3&_nc_sid=85a577&efg=eyJpIjoibyJ9&_nc_eui2=AeF7XKRDN4AEWBmaquM9pW0POBFdOTuySng4EV05O7JKeFKbOhhm8_faPLGdGvwig4d7ieRKKh6ERumR4kUtL-kb&_nc_ohc=gjx98vzxzPcAX_OgA0R&_nc_ad=z-m&_nc_cid=1390&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=a46dfae2fcd542c917634c373c59f689&oe=611F47F0",
      desc:"Nelton Menata programador profissional desde 2017",
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
        nome: "Canalizador",
        url: "assets/img/imagem.jpg",
        desc: "Descrição da Categoria",
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


}