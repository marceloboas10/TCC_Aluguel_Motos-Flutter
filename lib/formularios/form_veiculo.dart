import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormVeiculo extends StatefulWidget {
  @override
  _FormVeiculoState createState() => _FormVeiculoState();
}

class _FormVeiculoState extends State<FormVeiculo> {
  var txtFabricante = TextEditingController();
  var txtModelo = TextEditingController();
  var txtAno = TextEditingController();
  var txtPlaca = TextEditingController();
  var txtRenavam = TextEditingController();

  //RECUPERA DOCUMENTO
  void getDocumentById(String id) async {
    await FirebaseFirestore.instance
        .collection('veiculos')
        .doc(id)
        .get()
        .then((valor) {
      txtFabricante.text = valor.get('Fabricante');
      txtModelo.text = valor.get('Modelo');
      txtAno.text = valor.get('Ano');
      txtPlaca.text = valor.get('Placa');
      txtRenavam.text = valor.get('Renavam');
    });
  }

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)?.settings.arguments;

    if (id != null) {
      if (txtFabricante.text == '' &&
          txtModelo.text == '' &&
          txtAno.text == '' &&
          txtPlaca.text == '' &&
          txtRenavam.text == '') {
        getDocumentById(id.toString());
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro Veículo'),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent[400],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 70, 30, 30),
        child: ListView(children: [
          TextField(
            controller: txtFabricante,
            style: TextStyle(color: Colors.black, fontSize: 18),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Fabricante',
              labelStyle: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: txtModelo,
            style: TextStyle(color: Colors.black, fontSize: 18),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Modelo',
              labelStyle: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: txtAno,
            style: TextStyle(color: Colors.black, fontSize: 18),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Ano',
              labelStyle: TextStyle(color: Colors.black, fontSize: 16),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          SizedBox(height: 20),
          TextField(
            controller: txtPlaca,
            style: TextStyle(color: Colors.black, fontSize: 18),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Placa',
              labelStyle: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: txtRenavam,
            style: TextStyle(color: Colors.black, fontSize: 18),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Renavam',
              labelStyle: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          SizedBox(height: 20),
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
                      //ADICIONAR UM NOVO DOCUMENTO
                      var db = FirebaseFirestore.instance;
                      db.collection('veiculos').add({
                        'Fabricante': txtFabricante.text,
                        'Modelo': txtModelo.text,
                        'Ano': txtAno.text,
                        'Placa': txtPlaca.text,
                        'Renavam': txtRenavam.text,
                      });
                    } else {
                      //ATUALIZA DOCUMENTO
                      db.collection('veiculos').doc(id.toString()).update({
                        'Fabricante': txtFabricante.text,
                        'Modelo': txtModelo.text,
                        'Ano': txtAno.text,
                        'Placa': txtPlaca.text,
                        'Renavam': txtRenavam.text,
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
