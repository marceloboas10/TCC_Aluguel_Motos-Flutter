import 'package:aluguel_moto/shared/formularios/campos_formulario/campos_formulario.dart';
import 'package:aluguel_moto/shared/widgets/my_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormularioVeiculo extends StatefulWidget {
  @override
  _FormularioVeiculoState createState() => _FormularioVeiculoState();
}

class _FormularioVeiculoState extends State<FormularioVeiculo> {
  var txtFabricante = TextEditingController();
  var txtModelo = TextEditingController();
  var txtAno = TextEditingController();
  var txtPlaca = TextEditingController();
  var txtRenavam = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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

    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: MyAppBar(title: "Cadastro Veículo"),
        body: Container(
          padding: EdgeInsets.fromLTRB(30, 70, 30, 30),
          child: ListView(children: [
            CamposFormulario(
                nomeLabel: 'Marca',
                message: 'Informe o Nome',
                nomeCampo: txtFabricante,
                inputFormato: FilteringTextInputFormatter.singleLineFormatter),
            SizedBox(
              height: 20,
            ),
            CamposFormulario(
                nomeLabel: 'Modelo',
                message: 'Informe o Modelo',
                nomeCampo: txtModelo,
                inputFormato: FilteringTextInputFormatter.singleLineFormatter),
            SizedBox(height: 10),
            CamposFormulario(
                nomeLabel: 'Ano',
                message: 'Informe o Ano',
                nomeCampo: txtAno,
                keyboardType: TextInputType.number,
                inputFormato: FilteringTextInputFormatter.singleLineFormatter),
            SizedBox(height: 20),
            CamposFormulario(
                nomeLabel: 'Placa',
                message: 'Informe a Placa',
                nomeCampo: txtPlaca,
                inputFormato: FilteringTextInputFormatter.singleLineFormatter),
            SizedBox(height: 20),
            CamposFormulario(
                nomeLabel: 'Renavam',
                message: 'Informe o Renavam',
                nomeCampo: txtRenavam,
                keyboardType: TextInputType.number,
                inputFormato: FilteringTextInputFormatter.singleLineFormatter),
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
                      var formValid =
                          _formKey.currentState?.validate() ?? false;
                      var mensagemSnack =
                          'Formulário Incompleto\nVerifique os Campos';
                      var db = FirebaseFirestore.instance;

                      if (formValid) {
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
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(mensagemSnack)));
                      }
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
      ),
    );
  }
}
