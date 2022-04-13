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
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: ListView(children: [
          TextField(
            controller: txtNome,
            style: TextStyle(color: Colors.black, fontSize: 18),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nome',
              labelStyle: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: txtRg,
            style: TextStyle(color: Colors.black, fontSize: 18),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'RG',
              labelStyle: TextStyle(color: Colors.black, fontSize: 16),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          SizedBox(height: 10),
          TextField(
            controller: txtCpf,
            style: TextStyle(color: Colors.black, fontSize: 18),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'CPF',
              labelStyle: TextStyle(color: Colors.black, fontSize: 16),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          SizedBox(height: 10),
          TextField(
            controller: txtEndereco,
            style: TextStyle(color: Colors.black, fontSize: 18),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Endereço',
              labelStyle: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: txtTelefone,
            style: TextStyle(color: Colors.black, fontSize: 18),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Telefone',
              labelStyle: TextStyle(color: Colors.black, fontSize: 16),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          SizedBox(height: 10),
          TextField(
            controller: txtMoto,
            style: TextStyle(color: Colors.black, fontSize: 18),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Moto',
              labelStyle: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: txtPlaca,
            style: TextStyle(color: Colors.black, fontSize: 18),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Placa',
              labelStyle: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
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
