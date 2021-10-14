class LeilaoClienteModel {
  final String? localizacao;
  final String? desc;
  final int? valorMax;
  final String? clienteId;
  final String? objectId;
  final List<String>? categoria;
  bool? pedido = false;


  LeilaoClienteModel(
      {this.localizacao,
       this.valorMax,
       this.clienteId,
       this.desc,
       this.categoria,
       this.objectId,
       this.pedido});
}
