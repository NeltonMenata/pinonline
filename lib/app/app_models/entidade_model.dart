class EntidadeModel {
  final String nome;
  final String categoria;
  final String morada;
  final String contacto;
  final String email;
  final String desc;
  final String imgUrl;
  final String imgPerfilUrl;
  final String videoUrl;

  EntidadeModel(
      {required this.nome,
      required this.categoria,
      required this.morada,
      required this.contacto,
      required this.email,
      required this.desc,
      required this.imgUrl,
      required this.videoUrl,
      required this.imgPerfilUrl});

  static List<EntidadeModel> allEntidades() {
    return [
      EntidadeModel(
          nome:"Adao Pedro",
          categoria:"Canalizador",
          morada:"Malanje",
          contacto:"+244 912 557 358",
          email:"adaopedro@gmail.com",
          desc:"Funcionário de Primeira",
          imgUrl: "imgUrl",
          videoUrl: "videoUrl",
          imgPerfilUrl: "imgPerfilUrl"),
      EntidadeModel(
          nome: "Joao Miguel",
          categoria: "Electricista",
          morada: "Benguela",
          contacto: "+244 912 557 358",
          email: "joaomiguel@gmail.com",
          desc: "Funcionário de Segunda",
          imgUrl: "imgUrl",
          videoUrl: "videoUrl",
          imgPerfilUrl: "imgPerfilUrl"),
      EntidadeModel(
          nome: "Antonio Manuel",
          categoria: "Pedreiro",
         morada: "Namibe",
          contacto: "+244 912 557 358",
          email: "antoniomanuel@gmail.com",
          desc: "Funcionário de Terceira",
          imgUrl: "imgUrl",
          videoUrl: "videoUrl",
          imgPerfilUrl: "imgPerfilUrl"),
      EntidadeModel(
          nome: "Jose Afonso",
          categoria: "Pintor",
          morada: "Moxico",
          contacto: "+244 912 557 358",
          email: "joseafonso@gmail.com",
          desc: "Funcionário de Quarta",
          imgUrl: "imgUrl",
          videoUrl: "videoUrl",
          imgPerfilUrl: "imgPerfilUrl"),
      EntidadeModel(
          nome: "Carlos Cassoma",
          categoria: "Programador",
          morada: "Lunda-Sul",
          contacto: "+244 912 557 358",
          email: "carloscassoma@gmail.com",
          desc: "Funcionário de Quinta",
          imgUrl: "imgUrl",
          videoUrl: "videoUrl",
          imgPerfilUrl: "imgPerfilUrl"),
      EntidadeModel(
          nome: "Nelton Menata",
          categoria: "Programador",
          morada: "Luanda",
          contacto: "+244 912 557 358",
          email: "neltonmenataditec@gmail.com",
          desc: "Funcionário de Sexta",
          imgUrl: "imgUrl",
          videoUrl: "videoUrl",
          imgPerfilUrl: "imgPerfilUrl"),
      EntidadeModel(
          nome: "Vanilson Alberto",
          categoria: "Estucador",
          morada: "Zaire",
          contacto: "+244 912 557 358",
          email: "vanilsonalberto@gmail.com",
          desc: "Funcionário de Setima",
          imgUrl: "imgUrl",
          videoUrl: "videoUrl",
          imgPerfilUrl: "imgPerfilUrl"),
      EntidadeModel(
          nome: "Mavinga Santos",
          categoria: "Carpinteiro",
          morada: "Cabinda",
          contacto: "+244 912 557 358",
          email: "mavingasantos@gmail.com",
          desc: "Funcionário de Oitava",
          imgUrl: "imgUrl",
          videoUrl: "videoUrl",
          imgPerfilUrl: "imgPerfilUrl"),
    ];
  }
}
