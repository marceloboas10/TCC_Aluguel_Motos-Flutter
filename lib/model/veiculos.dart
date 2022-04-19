class Veiculos {
  late String id;
  late String fabricante;
  late String modelo;
  late String ano;
  late String placa;
  late String renavam;

//CONSTRUTOR
  Veiculos(this.id, this.fabricante, this.modelo, this.ano, this.placa,
      this.renavam);

//CONVERTER UM DOCUMENTO EM OBJETO
  Veiculos.fromJson(Map<String, dynamic> mapa, String id) {
    this.id = id;
    this.fabricante = mapa['Fabricante'];
    this.modelo = mapa['Modelo'];
    this.ano = mapa['Ano'];
    this.placa = mapa['Placa'];
    this.renavam = mapa['Renavam'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'fabricante': this.fabricante,
      'modelo': this.modelo,
      'ano': this.ano,
      'placa': this.placa,
      'renavam': this.renavam,
    };
  }

  doc(String id) {}
}
