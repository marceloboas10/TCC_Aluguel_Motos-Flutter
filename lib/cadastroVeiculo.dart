import 'package:aluguel_moto/model/veiculos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class CadastroVeiculo extends StatefulWidget {
  @override
  _CadastroVeiculoState createState() => _CadastroVeiculoState();
}

class _CadastroVeiculoState extends State<CadastroVeiculo> {

  //REFERENCIAR A COLEÇÃO "CLIENTES"
  late CollectionReference veiculos;

@override
void initState(){
	super.initState();
	veiculos = FirebaseFirestore.instance.collection('veiculos');
}

//APARENCIA DO ITEM DO LISTVIEW
Widget exibirDocumento(item){

  //CONVERTER UM DOCUMENTO EM UM OBJETO
  Veiculos veiculo = Veiculos.fromJson(item.data(), item.id);

  return Container(
    padding: EdgeInsets.all(5),
    child: ListTile(
    leading: Icon(Icons.motorcycle_rounded,color: Colors.black),
      title: Text(veiculo.modelo, style: TextStyle(fontSize: 20),),
      subtitle: Text(veiculo.placa, style: TextStyle(fontSize: 18),),
      trailing: IconButton(
        icon: Icon(Icons.delete,color: Colors.black),
        onPressed: (){
        //APAGAR DOCUMENTO
        veiculos.doc(veiculo.id).delete();
        },
      ),

      onTap: (){
        Navigator.pushNamed(context, '/form_veiculo', arguments: veiculo.id);
      },
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Veículos'),
        centerTitle: true,
        ),

      //EXIBE OS DOCUMENTOS DA COLEÇÃO "CLIENTES"
      body: Container(
        padding: EdgeInsets.all(30),
        child: StreamBuilder<QuerySnapshot>(
          
          //FONTE DOS DADOS
          stream: veiculos.snapshots(),
          
          //DEFINIR APARENCIA DOS DOCUMENTOS EXIBIDOS
          builder: (context,snapshot){

            switch(snapshot.connectionState){

              case ConnectionState.none:
                return Center(child: Text("Erro na Conexão ao Banco de Dados"));

                case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());

                default:
                final dados = snapshot.requireData;

                return ListView.builder(
                  itemCount: dados.size,
                  itemBuilder: (context, index){
                    return exibirDocumento(dados.docs[index]);
                  }
                );
            }
          }
        ),
      ),

      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.pushNamed(context, '/form_veiculo');
        },
      ),
    );
  }
}