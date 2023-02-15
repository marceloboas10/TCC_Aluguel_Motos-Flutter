import 'package:aluguel_moto/formularios/campos_formulario/campos_formulario.dart';
import 'package:aluguel_moto/model/lembretes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
//Registrar o Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class CadastroLembretes extends StatefulWidget {
  @override
  _CadastroLembretesState createState() => _CadastroLembretesState();
}

class _CadastroLembretesState extends State<CadastroLembretes> {
  //Referenciar a coleção nomeada "lembretes"
  late CollectionReference lembretes;

  @override
  void initState() {
    super.initState();
    lembretes = FirebaseFirestore.instance.collection('lembretes');
  }

//Aparência do item do ListView
  Widget exibirDocumento(item) {
    //Converter um DOCUMENTO em um OBJETO
    Lembrete lembrete = Lembrete.fromJson(item.data(), item.id);

    return Container(
      padding: EdgeInsets.all(5),
      child: ListTile(
        title: Text(lembrete.servico, style: TextStyle(fontSize: 20)),
        subtitle: Text(lembrete.descricao, style: TextStyle(fontSize: 18)),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            //Apagar um documento
            lembretes.doc(lembrete.id).delete();
          },
        ),
        onTap: () {
          Navigator.pushNamed(context, '/cadastro', arguments: lembrete.id);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lembretes'),
        centerTitle: true,
        backgroundColor: Colors.cyan[600],
      ),
      backgroundColor: Colors.brown[50],
      //EXIBIR os documentos da coleção de "lembretes"
      body: Container(
        padding: EdgeInsets.all(30),
        child: StreamBuilder<QuerySnapshot>(
            //fonte de dados
            stream: lembretes.snapshots(),
            //definir a aparência dos documentos que serão exibidos
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(child: Text('Erro ao conectar ao Firestore'));

                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );

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
        backgroundColor: Colors.cyan[600],
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/cadastro');
        },
      ),
    );
  }
}

// TELA CADASTRO
class TelaCadastro extends StatefulWidget {
  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  var txtServico = TextEditingController();
  var txtDescricao = TextEditingController();

  //RECUPERAR documento
  void getDocumentById(String id) async {
    await FirebaseFirestore.instance
        .collection('lembretes')
        .doc(id)
        .get()
        .then((valor) {
      txtServico.text = valor.get('servico');
      txtDescricao.text = valor.get('descricao');
    });
  }

  @override
  Widget build(BuildContext context) {
    //RECUPERAR id do lembretes
    var id = ModalRoute.of(context)?.settings.arguments;

    if (id != null) {
      if (txtServico.text == '' && txtDescricao.text == '') {
        getDocumentById(id.toString());
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Lembretes'),
        centerTitle: true,
        backgroundColor: Colors.cyan[600],
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.brown[50],
      body: Container(
        padding: EdgeInsets.all(30),
        child: ListView(
          children: [
            CamposFormulario(nomeLabel: 'Serviço', nomeCampo: txtServico),
            SizedBox(
              height: 20,
            ),
            CamposFormulario(nomeLabel: 'Descrição', nomeCampo: txtDescricao),
            SizedBox(height: 50),
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
                        //ADICIONAR um novo DOCUMENTO
                        var db = FirebaseFirestore.instance;
                        db.collection('lembretes').add({
                          'servico': txtServico.text,
                          'descricao': txtDescricao.text,
                        });
                      } else {
                        //ATUALIZAR documento
                        db.collection('lembretes').doc(id.toString()).update({
                          'servico': txtServico.text,
                          'descricao': txtDescricao.text,
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
    );
  }
}
