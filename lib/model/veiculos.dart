class Veiculos{
  late String id;
  late String fabricante;
  late String modelo;
  late String ano;
  late String placa;
  
//CONSTRUTOR
Veiculos(this.id,this.fabricante,this.modelo,this.ano,this.placa);

//CONVERTER UM DOCUMENTO EM OBJETO
  Veiculos.fromJson(Map<String,dynamic>mapa, String id){
    this.id = id;
    this.fabricante = mapa['Fabricante'];
    this.modelo = mapa['Modelo'];
    this.ano = mapa['Ano'];
    this.placa = mapa['Placa'];
}

  Map<String,dynamic> toJson(){
    return {
      'id'            : this.id,
      'fabricante'    : this.fabricante,
      'modelo'        : this.modelo,
      'ano'           : this.ano,
      'placa'         : this.placa,
    };
  }

  doc(String id) {}

}