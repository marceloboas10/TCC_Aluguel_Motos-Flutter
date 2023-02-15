import 'package:aluguel_moto/formularios/campos_formulario/campos_formulario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormCliente extends StatefulWidget {
  @override
  _FormClienteState createState() => _FormClienteState();
}

class _FormClienteState extends State<FormCliente> {
  var txtNome = TextEditingController();
  var txtRg = TextEditingController();
  var txtCpf = TextEditingController();
  var txtEndereco = TextEditingController();
  var txtTelefone = TextEditingController();
  var txtMoto = TextEditingController();
  var txtPlaca = TextEditingController();

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
      txtEndereco.text = valor.get('Endereço');
      txtTelefone.text = valor.get('Telefone');
      txtMoto.text = valor.get('Moto');
      txtPlaca.text = valor.get('Placa');
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
          txtEndereco.text == '' &&
          txtTelefone.text == '' &&
          txtMoto.text == '' &&
          txtPlaca.text == '') {
        getDocumentById(id.toString());
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro Cliente'),
        centerTitle: true,
        backgroundColor: Colors.cyan[600],
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: ListView(children: [
          CamposFormulario(nomeLabel: 'Nome', nomeCampo: txtNome),
          SizedBox(height: 10),
          CamposFormulario(
              nomeLabel: 'RG',
              nomeCampo: txtRg,
              keyboardType: TextInputType.number,
              inputFormato: FilteringTextInputFormatter.digitsOnly),
          SizedBox(height: 10),
          CamposFormulario(
              nomeLabel: 'CPF',
              nomeCampo: txtCpf,
              keyboardType: TextInputType.number,
              inputFormato: FilteringTextInputFormatter.digitsOnly),
          SizedBox(height: 10),
          CamposFormulario(nomeLabel: 'Endereço', nomeCampo: txtEndereco),
          SizedBox(height: 10),
          CamposFormulario(
              nomeLabel: 'Telefone',
              nomeCampo: txtTelefone,
              keyboardType: TextInputType.number,
              inputFormato: FilteringTextInputFormatter.digitsOnly),
          SizedBox(height: 10),
          CamposFormulario(nomeLabel: 'Moto', nomeCampo: txtMoto),
          SizedBox(height: 10),
          CamposFormulario(nomeLabel: 'Placa', nomeCampo: txtPlaca),
          SizedBox(height: 10),
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
                        'Endereço': txtEndereco.text,
                        'Telefone': txtTelefone.text,
                        'Moto': txtMoto.text,
                        'Placa': txtPlaca.text,
                      });
                    } else {
                      //ATUALIZA DOCUMENTO
                      db.collection('clientes').doc(id.toString()).update({
                        'Nome': txtNome.text,
                        'RG': txtRg.text,
                        'CPF': txtCpf.text,
                        'Endereço': txtEndereco.text,
                        'Telefone': txtTelefone.text,
                        'Moto': txtMoto.text,
                        'Placa': txtPlaca.text,
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
        ]),
      ),
    );
  }
}
