class EntidadeModel {
  final String nome;
  final String senha;
  final String categoria;
  final String morada;
  final String contacto;
  final String email;
  final String desc;
  final String img;
  final String objectId;
  bool? isSelected = false;
  bool? admin = false;
  

  EntidadeModel(
      {required this.nome,
      required this.senha,
      required this.categoria,
      required this.morada,
      required this.contacto,
      required this.email,
      required this.desc,
      required this.img,
      required this.objectId,
      this.admin,
      this.isSelected
      });

  static List<EntidadeModel> allEntidades() {
    return [
      EntidadeModel(
          nome: "Adao Pedro",
          categoria: "Canalizador",
          morada: "Malanje",
          contacto: "+244 912 557 358",
          email: "adaopedro@gmail.com",
          desc: "Funcionário de Primeira",
          img: "img",
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
          img: "img",
          objectId: "kjdfla1243"),
      EntidadeModel(
          nome: "Antonio Manuel",
          categoria: "Pedreiro",
          senha: "1",
          morada: "Namibe",
          contacto: "+244 912 557 358",
          email: "antoniomanuel@gmail.com",
          desc: "Funcionário de Terceira",
          img: "img",
          objectId: "fak34dlf"),
      EntidadeModel(
          nome: "Jose Afonso",
          categoria: "Pintor",
          morada: "Moxico",
          senha: "1",
          contacto: "+244 912 557 358",
          email: "joseafonso@gmail.com",
          desc: "Funcionário de Quarta",
          img: "img",
          objectId: "dflk34sdf"),
      EntidadeModel(
          nome: "Carlos Cassoma",
          categoria: "Programador",
          morada: "Lunda-Sul",
          senha: "1",
          contacto: "+244 912 557 358",
          email: "carloscassoma@gmail.com",
          desc: "Funcionário de Quinta",
          img: "img",
          objectId: "dflk2343"),
      EntidadeModel(
          nome: "Nelton Menata",
          categoria: "Programador",
          senha: "1",
          morada: "Luanda",
          contacto: "+244 912 557 358",
          email: "neltonmenataditec@gmail.com",
          desc: "Funcionário de Sexta",
          img: "img",
          objectId: "jdf23ere"),
      EntidadeModel(
          nome: "Vanilson Alberto",
          categoria: "Estucador",
          morada: "Zaire",
          senha: "1",
          contacto: "+244 912 557 358",
          email: "vanilsonalberto@gmail.com",
          desc: "Funcionário de Setima",
          img: "img",
          objectId: "dfj23rfd"),
      EntidadeModel(
        nome: "Mavinga Santos",
        categoria: "Carpinteiro",
        morada: "Cabinda",
        senha: "1",
        contacto: "+244 912 557 358",
        email: "mavingasantos@gmail.com",
        desc: "Funcionário de Oitava",
        img: "img",
        objectId: "df32rdf3",
      ),
    ];
  }
}
