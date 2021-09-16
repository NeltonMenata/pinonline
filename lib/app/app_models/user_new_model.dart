class UserNew {
  final String nome;
  final String email;
  final String senha;

  UserNew(this.nome, this.email, this.senha);
}

class UserNewFull {
  final UserNew userNew;
  final String telefone;
  final String morada;
  final String cidade;
  final String desc;

  UserNewFull(this.userNew,
      {required this.telefone,
      required this.morada,
      required this.cidade,
      required this.desc});
}
