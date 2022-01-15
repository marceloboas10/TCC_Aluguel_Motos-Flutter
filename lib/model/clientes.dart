class Clientes{
  late String id;
  late String nome;
  late String rg;
  late String cpf;
  late String endereco;
  late String telefone;
  late String moto;
  late String placa;

//CONSTRUTOR
Clientes(this.id,this.nome,this.rg,this.cpf,this.endereco,this.telefone, this.moto,this.placa);

//CONVERTER UM DOCUMENTO EM OBJETO
  Clientes.fromJson(Map<String,dynamic>mapa, String id){
    this.id = id;
    this.nome = mapa['Nome'];
    this.rg = mapa['RG'];
    this.cpf = mapa['CPF'];
    this.endereco = mapa['Endereço'];
    this.telefone = mapa['Telefone'];
    this.moto = mapa['Moto'];
    this.placa = mapa['Placa'];
}

  Map<String,dynamic> toJson(){
    return {
      'id'         : this.id,
      'nome'       : this.nome,
      'rg'         : this.rg,
      'cpf'        : this.cpf,
      'endereco'   : this.endereco,
      'telefone'   : this.telefone,
      'moto'       : this.moto,
      'placa'      : this.placa,
    };
  }

  doc(String id) {}

}