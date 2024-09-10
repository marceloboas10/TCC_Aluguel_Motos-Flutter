import 'package:aluguel_moto/model/clientes.dart';
import 'package:aluguel_moto/shared/widgets/my_app_bar.dart';
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
        leading: Icon(
          Icons.person,
          color: Colors.black,
          size: 40,
        ),
        title: Text(cliente.nome, style: TextStyle(fontSize: 20)),
        subtitle: cliente.motoAlugada != '0'
            ? Text('${cliente.cpf} Placa: ${cliente.motoAlugada}',
                style: TextStyle(fontSize: 18))
            : Text('${cliente.cpf}', style: TextStyle(fontSize: 18)),
        isThreeLine: true,
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.black, size: 30),
          onPressed: () {
            //APAGAR DOCUMENTO
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text(
                  "Excluir Cliente",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                content: Text(
                  "Tem certeza que deseja excluir ${cliente.nome}?",
                  style: TextStyle(fontSize: 20),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Não",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Cliente ${cliente.nome} excluído com sucesso!',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                      clientes.doc(cliente.id).delete();
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Sim",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ],
              ),
            );
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
    return Scaffold(
      appBar: MyAppBar(title: "Clientes"),

      //EXIBE OS DOCUMENTOS DA COLEÇÃO "CLIENTES"
      body: Container(
        padding: EdgeInsets.all(30),
        child: StreamBuilder<QuerySnapshot>(

            //FONTE DE DADOS
            stream: clientes.orderBy("Nome").snapshots(),

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
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/form_cliente');
        },
      ),
    );
  }
}
