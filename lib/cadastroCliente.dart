import 'package:aluguel_moto/model/clientes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CadastroCliente extends StatefulWidget {
  @override
  _CadastroClienteState createState() => _CadastroClienteState();
}

class _CadastroClienteState extends State<CadastroCliente> {
  //REFERENCIAR A COLEÇÃO "CLIENTES" DO FIREBASE
  late CollectionReference clientes;

  @override
  void initState() {
    super.initState();
    clientes = FirebaseFirestore.instance.collection('clientes');
  }

//APARENCIA DO ITEM DO LISTVIEW
  Widget exibirDocumento(item) {
    //CONVERTER UM DOCUMENTO EM UM OBJETO
    Clientes cliente = Clientes.fromJson(item.data(), item.id);

    return Container(
      padding: EdgeInsets.all(5),
      child: ListTile(
        leading: Icon(Icons.person, color: Colors.black),
        title: Text(cliente.nome, style: TextStyle(fontSize: 20)),
        subtitle: Text(cliente.cpf, style: TextStyle(fontSize: 18)),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.black),
          onPressed: () {
            //APAGAR DOCUMENTO
            clientes.doc(cliente.id).delete();
          },
        ),
        onTap: () {
          Navigator.pushNamed(context, '/form_cliente', arguments: cliente.id);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Clientes'),
          centerTitle: true,
        ),

        //EXIBE OS DOCUMENTOS DA COLEÇÃO "CLIENTES"
        body: Container(
          padding: EdgeInsets.all(30),
          child: StreamBuilder<QuerySnapshot>(

              //FONTE DE DADOS
              stream: clientes.snapshots(),

              //DEFINIR APARENCIA DOS DOCUMENTOS EXIBIDOS
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Center(
                        child: Text("Erro na Conexão ao Banco de Dados"));

                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());

                  default:
                    final dados = snapshot.requireData;

                    return ListView.builder(
                        itemCount: dados.size,
                        itemBuilder: (context, index) {
                          return exibirDocumento(dados.docs[index]);
                        });
                }
              }),
        ),

        floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blueGrey,
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, '/form_cliente');
          },
        ),
      ),
    );
  }
}
