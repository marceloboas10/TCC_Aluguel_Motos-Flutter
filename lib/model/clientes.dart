class Clientes {
  late String id;
  late String nome;
  late String rg;
  late String cpf;
  late String telefone;
  late String validadeCnh;
  late String cep;
  late String endereco;
  late String numeroCasa;
  late String complemento;
  late String bairro;
  late String cidade;

//CONSTRUTOR
  Clientes(
    this.id,
    this.nome,
    this.rg,
    this.cpf,
    this.telefone,
    this.validadeCnh,
    this.cep,
    this.endereco,
    this.numeroCasa,
    this.complemento,
    this.bairro,
    this.cidade,
  );

//CONVERTER UM DOCUMENTO EM OBJETO
  Clientes.fromJson(Map<String, dynamic> mapa, String id) {
    this.id = id;
    this.nome = mapa['Nome'];
    this.rg = mapa['RG'];
    this.cpf = mapa['CPF'];
    this.telefone = mapa['Telefone'];
    this.validadeCnh = mapa['Validade_CNH'];
    this.cep = mapa['CEP'];
    this.endereco = mapa['Endereço'];
    this.numeroCasa = mapa['Numero_Casa'];
    this.complemento = mapa['Complemento'];
    this.bairro = mapa['Bairro'];
    this.cidade = mapa['Cidade'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'nome': this.nome,
      'rg': this.rg,
      'cpf': this.cpf,
      'telefone': this.telefone,
      'validade_cnh': this.validadeCnh,
      'cep': this.cep,
      'endereco': this.endereco,
      'numero': this.numeroCasa,
      'complemento': this.complemento,
      'bairro': this.bairro,
      'cidade': this.cidade,
    };
  }

  doc(String id) {}
}
