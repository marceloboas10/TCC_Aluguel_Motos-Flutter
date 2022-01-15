import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {

  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('lib/imagens/logo.png', height: 116,),
              TextField(
                autofocus: true,
                controller: txtEmail,
                style: new TextStyle(color: Colors.white, fontSize: 15),
                decoration: InputDecoration(
                  icon: Icon(Icons.person, color: Colors.white,),
                  labelText: "Usuário",
                  labelStyle: TextStyle(color: Colors.white)),
                ),
                Divider(),
                TextField(
                autofocus: true,
                obscureText: true,
                controller: txtSenha,
                style: new TextStyle(color: Colors.white, fontSize: 15),
                decoration: InputDecoration(
                  icon: Icon(Icons.password, color: Colors.white,),
                  labelText: "Senha",
                  labelStyle: TextStyle(color: Colors.white)),
                ),
                Divider(),
                  ButtonTheme(
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isloading = true;
                        });
                        login(txtEmail.text, txtSenha.text);
                      },
                      child: Text(
                        "Entrar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Divider(),
                  Divider(),
                  ButtonTheme(
                    height: 30,
                    child: ElevatedButton(
                      child: Text(
                        "Criar Conta",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/cadastroConta');
                      },                   
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// Login com o Firebase Auth
  void login(email, senha){

    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email, password: senha).then((resultado){
        isloading = false;
        Navigator.pushReplacementNamed(
          context, '/menu', arguments: resultado.user!.uid,);

    }).catchError((erro){

      var mensagem = '';
      if (erro.code == 'user-not-found'){
        mensagem = 'ERRO: Usuário não encontrado.';
      }else if (erro.code == 'wrong-password'){
        mensagem = 'ERRO: Senha incorreta.';
      }else if (erro.code == 'invalid-email'){
        mensagem = 'ERRO: Email inválido.';
      }else{
        mensagem = 'ERRO: ${erro.message}';
      }
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$mensagem'),
            duration: Duration(seconds: 2)
          )
        );
    });
  }
}