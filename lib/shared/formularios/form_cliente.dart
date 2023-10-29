import 'dart:convert';
import 'package:aluguel_moto/shared/formularios/campos_formulario/campos_formulario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class FormCliente extends StatefulWidget {
  @override
  _FormClienteState createState() => _FormClienteState();
}

class _FormClienteState extends State<FormCliente> {
  var txtNome = TextEditingController();
  var txtRg = TextEditingController();
  var txtCpf = TextEditingController();
  var txtCep = TextEditingController();
  var txtEndereco = TextEditingController();
  var txtComplemento = TextEditingController();
  var txtNumeroCasa = TextEditingController();
  var txtBairro = TextEditingController();
  var txtCidade = TextEditingController();
  var txtTelefone = TextEditingController();
  var txtTelefoneReferencia = TextEditingController();
  var txtTelefoneReferencia2 = TextEditingController();
  var txtValidadeCnh = TextEditingController();
  var txtmotoAlugada = TextEditingController();
  String placaSelecionada = '0';

  //RECUPERAR documento
  void getDocumentById(String id) async {
    await FirebaseFirestore.instance
        .collection('clientes')
        .doc(id)
        .get()
        .then((valor) {
      txtNome.text = valor.get('Nome');
      txtRg.text = valor.get('RG');
      txtCpf.text = valor.get('CPF');
      txtValidadeCnh.text = valor.get('Validade_CNH');
      txtTelefone.text = valor.get('Telefone');
      txtTelefoneReferencia.text = valor.get('Telefone_referencia');
      txtTelefoneReferencia2.text = valor.get('Telefone_referencia2');
      txtCep.text = valor.get('CEP');
      txtEndereco.text = valor.get('Endereço');
      txtNumeroCasa.text = valor.get('Numero_Casa');
      txtComplemento.text = valor.get('Complemento');
      txtBairro.text = valor.get('Bairro');
      txtCidade.text = valor.get('Cidade');
      placaSelecionada = valor.get('Moto_alugada');
    });
  }

  @override
  Widget build(BuildContext context) {
    //RECUPERA ID DO VEICULO
    var id = ModalRoute.of(context)?.settings.arguments;

    if (id != null) {
      if (txtNome.text == '' &&
          txtRg.text == '' &&
          txtCpf.text == '' &&
          txtTelefone.text == '' &&
          txtEndereco.text == '') {
        getDocumentById(id.toString());
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text('Cadastro Cliente'),
        centerTitle: true,
        backgroundColor: Colors.cyan[600],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 3, left: 10, right: 10),
              width: double.infinity,
              height: 310,
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListView(
                    children: [
                      CamposFormulario(nomeLabel: 'Nome', nomeCampo: txtNome),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CamposFormulario(
                              nomeLabel: 'RG',
                              nomeCampo: txtRg,
                              keyboardType: TextInputType.number,
                              inputFormato:
                                  FilteringTextInputFormatter.digitsOnly),
                          CamposFormulario(
                              nomeLabel: 'CPF',
                              nomeCampo: txtCpf,
                              keyboardType: TextInputType.number,
                              inputFormato:
                                  FilteringTextInputFormatter.digitsOnly),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CamposFormulario(
                              nomeLabel: 'Telefone 1',
                              nomeCampo: txtTelefone,
                              keyboardType: TextInputType.number,
                              inputFormato:
                                  FilteringTextInputFormatter.digitsOnly),
                          CamposFormulario(
                              nomeLabel: 'Telefone 2',
                              nomeCampo: txtTelefoneReferencia),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CamposFormulario(
                              nomeLabel: 'Telefone 3',
                              nomeCampo: txtTelefoneReferencia2),
                          CamposFormulario(
                              nomeLabel: 'Validade CNH',
                              nomeCampo: txtValidadeCnh,
                              keyboardType: TextInputType.number,
                              inputFormato:
                                  FilteringTextInputFormatter.digitsOnly),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //ENDEREÇO CADASTRAIS
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              width: double.infinity,
              height: 413,
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListView(
                    children: [
                      SizedBox(
                        width: 135,
                        child: TextField(
                          controller: txtCep,
                          onChanged: (String value) async {
                            var cep = value;
                            if (cep.length == 8) {
                              var response = await http.get(Uri.parse(
                                  'https://viacep.com.br/ws/$cep/json'));
                              var json = jsonDecode(response.body);
                              txtEndereco.text = json['logradouro'];
                              txtBairro.text = json['bairro'];
                              txtCidade.text = json['localidade'];
                              txtComplemento.text = json['complemento'];
                              txtCep.text = json['cep'];
                            }
                            setState(() {});
                          },
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'CEP',
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          inputFormatters: [],
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      SizedBox(
                        width: 280,
                        child: TextField(
                          controller: txtEndereco,
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Rua',
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          inputFormatters: [],
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 70,
                            child: TextField(
                              controller: txtNumeroCasa,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Nº',
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                              inputFormatters: [],
                            ),
                          ),
                          SizedBox(
                            width: 280,
                            child: TextField(
                              controller: txtComplemento,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Complemento',
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                              inputFormatters: [],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 7),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 200,
                              child: TextField(
                                controller: txtBairro,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Bairro',
                                  labelStyle: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                inputFormatters: [],
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              child: TextField(
                                controller: txtCidade,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Cidade',
                                  labelStyle: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                inputFormatters: [],
                              ),
                            ),
                          ]),
                      SizedBox(
                          width: 150,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 7, top: 7),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 7,
                                ),
                                Text('Moto Alugada'),
                                StreamBuilder<QuerySnapshot>(
                                    stream: FirebaseFirestore.instance
                                        .collection('veiculos')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      List<DropdownMenuItem> placasVeiculos =
                                          [];
                                      if (!snapshot.hasData) {
                                        const CircularProgressIndicator();
                                      } else {
                                        final placas = snapshot
                                            .data?.docs.reversed
                                            .toList();
                                        placasVeiculos.add(
                                          const DropdownMenuItem(
                                            value: '0',
                                            child: Text('Motos Disponíveis'),
                                          ),
                                        );
                                        for (var placa in placas!) {
                                          placasVeiculos.add(
                                            DropdownMenuItem(
                                              value: placa.get('Placa'),
                                              child: Text(placa['Placa']),
                                            ),
                                          );
                                        }
                                      }

                                      return DropdownButton<dynamic>(
                                        items: placasVeiculos,
                                        onChanged: (placaValue) {
                                          setState(() {
                                            placaSelecionada = placaValue;
                                          });
                                        },
                                        value: placaSelecionada,
                                      );
                                    }),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            width: 150,
                            child: OutlinedButton(
                              child: Text('salvar'),
                              onPressed: () {
                                var db = FirebaseFirestore.instance;

                                if (id == null) {
                                  //ADICIONA UM NOVO DOCUMENTO
                                  var db = FirebaseFirestore.instance;
                                  db.collection('clientes').add({
                                    'Nome': txtNome.text,
                                    'RG': txtRg.text,
                                    'CPF': txtCpf.text,
                                    'Telefone': txtTelefone.text,
                                    'Telefone_referencia':
                                        txtTelefoneReferencia.text,
                                    'Telefone_referencia2':
                                        txtTelefoneReferencia.text,
                                    'Validade_CNH': txtValidadeCnh.text,
                                    'CEP': txtCep.text,
                                    'Endereço': txtEndereco.text,
                                    'Numero_Casa': txtNumeroCasa.text,
                                    'Complemento': txtComplemento.text,
                                    'Bairro': txtBairro.text,
                                    'Cidade': txtCidade.text,
                                    'Moto_Alugada': placaSelecionada,
                                  });
                                } else {
                                  //ATUALIZA DOCUMENTO
                                  db
                                      .collection('clientes')
                                      .doc(id.toString())
                                      .update({
                                    'Nome': txtNome.text,
                                    'RG': txtRg.text,
                                    'CPF': txtCpf.text,
                                    'Telefone': txtTelefone.text,
                                    'Telefone_referencia':
                                        txtTelefoneReferencia.text,
                                    'Telefone_referencia2':
                                        txtTelefoneReferencia.text,
                                    'Validade_CNH': txtValidadeCnh.text,
                                    'CEP': txtCep.text,
                                    'Endereço': txtEndereco.text,
                                    'Numero_Casa': txtNumeroCasa.text,
                                    'Complemento': txtComplemento.text,
                                    'Bairro': txtBairro.text,
                                    'Cidade': txtCidade.text,
                                    'Moto_alugada': placaSelecionada,
                                  });
                                }
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            width: 150,
                            child: OutlinedButton(
                              child: Text('cancelar'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
