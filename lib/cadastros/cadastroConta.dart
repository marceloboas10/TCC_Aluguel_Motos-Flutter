import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CadastroConta extends StatefulWidget {
  const CadastroConta({ Key? key }) : super(key: key);

  @override
  _CadastroContaState createState() => _CadastroContaState();
}

class _CadastroContaState extends State<CadastroConta> {

var txtNome = TextEditingController();
var txtEmail = TextEditingController();
var txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text('Criar Conta'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: ListView(children: [
          TextField(
            controller: txtNome,
            style: TextStyle(color: Colors.black, fontSize: 18),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              labelText: 'Nome',
              labelStyle: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          SizedBox(height: 10),

          TextField(
            controller: txtEmail,
            style: TextStyle(color: Colors.black, fontSize: 18),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email),
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          SizedBox(height: 10),

          TextField(
            obscureText: true,
            controller: txtSenha,
            style: TextStyle(color: Colors.black, fontSize: 18),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              labelText: 'Senha',
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
                  child: Text('criar'),
                  onPressed: (){
                    criarConta(txtNome.text, txtEmail.text, txtSenha.text);
                      },
                    ),
                  ),
                Container(
                  padding: EdgeInsets.all(5),
                  width: 150,
                  child: OutlinedButton(
                    child: Text('cancelar'),
                    onPressed: (){
                    Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height:60),
          ],
        ),
      ),
    );
  }

  //CRIAR CONTA no Fiebase AUTH
    void criarConta(nome, email, senha) {

      FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, password: senha).then((resultado){

          //Armazenar dados no Firestore
          var db = FirebaseFirestore.instance;
          db.collection('usuarios').doc(resultado.user!.uid).set(
            {
              'nome'  : nome,
              'email' : email,
            }       
          ).then((valor) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Usuário criado com sucesso'),
                duration: Duration(seconds: 2)
              )
            );
            Navigator.pop(context);
          });
        
    }).catchError((erro){
      if (erro.code == 'email-already-in-use'){
        ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('ERRO: o email informado já está em uso.'),
                duration: Duration(seconds: 2)
              )
            );
          }else{
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('ERRO: ${erro.message}'),
                duration: Duration(seconds: 2)
              )
            );
          }
    });
  }
}