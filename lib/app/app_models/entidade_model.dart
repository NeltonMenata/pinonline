class EntidadeModel {
  final String nome;
  final String senha;
  final String categoria;
  final String morada;
  final String contacto;
  final String email;
  final String desc;
  final String imgUrl;
  final String imgPerfilUrl;
  final String videoUrl;
  final String objectId;

  EntidadeModel(
      {required this.nome,
      required this.senha,
      required this.categoria,
      required this.morada,
      required this.contacto,
      required this.email,
      required this.desc,
      required this.imgUrl,
      required this.videoUrl,
      required this.imgPerfilUrl,
      required this.objectId});

  static List<EntidadeModel> allEntidades() {
    return [
      EntidadeModel(
          nome: "Adao Pedro",
          categoria: "Canalizador",
          morada: "Malanje",
          contacto: "+244 912 557 358",
          email: "adaopedro@gmail.com",
          desc: "Funcionário de Primeira",
          imgUrl: "imgUrl",
          videoUrl: "videoUrl",
          imgPerfilUrl: "imgPerfilUrl",
          senha: "1",
          objectId: "23flksjlk3"),
      EntidadeModel(
          nome: "Joao Miguel",
          categoria: "Electricista",
          morada: "Benguela",
          senha: "1",
          contacto: "+244 912 557 358",
          email: "joaomiguel@gmail.com",
          desc: "Funcionário de Segunda",
          imgUrl: "imgUrl",
          videoUrl: "videoUrl",
          imgPerfilUrl: "imgPerfilUrl",
          objectId: "kjdfla1243"),
      EntidadeModel(
          nome: "Antonio Manuel",
          categoria: "Pedreiro",
          senha: "1",
          morada: "Namibe",
          contacto: "+244 912 557 358",
          email: "antoniomanuel@gmail.com",
          desc: "Funcionário de Terceira",
          imgUrl: "imgUrl",
          videoUrl: "videoUrl",
          imgPerfilUrl: "imgPerfilUrl",
          objectId: "fak34dlf"),
      EntidadeModel(
          nome: "Jose Afonso",
          categoria: "Pintor",
          morada: "Moxico",
          senha: "1",
          contacto: "+244 912 557 358",
          email: "joseafonso@gmail.com",
          desc: "Funcionário de Quarta",
          imgUrl: "imgUrl",
          videoUrl: "videoUrl",
          imgPerfilUrl: "imgPerfilUrl",
          objectId: "dflk34sdf"),
      EntidadeModel(
          nome: "Carlos Cassoma",
          categoria: "Programador",
          morada: "Lunda-Sul",
          senha: "1",
          contacto: "+244 912 557 358",
          email: "carloscassoma@gmail.com",
          desc: "Funcionário de Quinta",
          imgUrl: "imgUrl",
          videoUrl: "videoUrl",
          imgPerfilUrl: "imgPerfilUrl",
          objectId: "dflk2343"),
      EntidadeModel(
          nome: "Nelton Menata",
          categoria: "Programador",
          senha: "1",
          morada: "Luanda",
          contacto: "+244 912 557 358",
          email: "neltonmenataditec@gmail.com",
          desc: "Funcionário de Sexta",
          imgUrl: "imgUrl",
          videoUrl: "videoUrl",
          imgPerfilUrl: "imgPerfilUrl",
          objectId: "jdf23ere"),
      EntidadeModel(
          nome: "Vanilson Alberto",
          categoria: "Estucador",
          morada: "Zaire",
          senha: "1",
          contacto: "+244 912 557 358",
          email: "vanilsonalberto@gmail.com",
          desc: "Funcionário de Setima",
          imgUrl: "imgUrl",
          videoUrl: "videoUrl",
          imgPerfilUrl: "imgPerfilUrl",
          objectId: "dfj23rfd"),
      EntidadeModel(
        nome: "Mavinga Santos",
        categoria: "Carpinteiro",
        morada: "Cabinda",
        senha: "1",
        contacto: "+244 912 557 358",
        email: "mavingasantos@gmail.com",
        desc: "Funcionário de Oitava",
        imgUrl: "imgUrl",
        videoUrl: "videoUrl",
        imgPerfilUrl: "imgPerfilUrl",
        objectId: "df32rdf3",
      ),
    ];
  }
}
