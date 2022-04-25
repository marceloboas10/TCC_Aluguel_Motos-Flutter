class Lembrete {
  late String id;
  late String servico;
  late String descricao;

  //Construtor
  Lembrete(this.id, this.servico, this.descricao);

  //Converter um DOCUMENTO em um OBJETO
  Lembrete.fromJson(Map<String, dynamic> mapa, String id) {
    this.id = id;
    this.servico = mapa['servico'];
    this.descricao = mapa['descricao'];
  }

  //Converter um OBJETO em um DOCUMENTO
  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'servico': this.servico,
      'descricao': this.descricao,
    };
  }
}
