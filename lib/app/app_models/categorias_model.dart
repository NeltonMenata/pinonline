class Categoria{

  final String nome;
  final String url;
  final String desc;
  final int id;
  bool selected;


  Categoria({required this.nome,
             required this.url, 
             required this.desc,
             required this.id,
             required this.selected,
             });

  factory Categoria.fromJson(Map data){
    
    return Categoria(
      nome: data["nome"],
      desc: data["desc"],
      url: data["url"],
      id: data["id"],
      selected: data["seletecd"] ?? false
    );
  }
  Map toJson(){
    return {
      "nome": this.nome,
      "desc": this.desc,
      "url": this.url,
      "id": this.id,
      "selected": this.selected
    };
  }
}
