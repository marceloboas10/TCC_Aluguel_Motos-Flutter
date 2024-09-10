import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(119, 136, 153, 1),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/logo1.png',
                height: 100,
              ),
              Padding(padding: EdgeInsets.only(top: 15)),
              TextField(
                controller: txtEmail,
                style: new TextStyle(color: Colors.white, fontSize: 13),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  labelText: "Usuário",
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              Divider(),
              TextField(
                obscureText: true,
                controller: txtSenha,
                style: new TextStyle(color: Colors.white, fontSize: 13),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  )),
                  labelText: "Senha",
                  prefixIcon: Icon(
                    Icons.lock_sharp,
                    color: Colors.white,
                  ),
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              Divider(),
              ElevatedButton(
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
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.red[700])),
              ),
              ElevatedButton(
                child: Text(
                  "Criar Conta",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.red[600])),
                onPressed: () {
                  Navigator.pushNamed(context, '/cadastroConta');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

// Login com o Firebase Auth
  void login(email, senha) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((resultado) {
      isloading = false;
      Navigator.pushReplacementNamed(
        context,
        '/menu',
        arguments: resultado.user!.uid,
      );
    }).catchError((erro) {
      var mensagem = '';
      if (erro.code == 'user-not-found') {
        mensagem = 'ERRO: Usuário não encontrado.';
      } else if (erro.code == 'wrong-password') {
        mensagem = 'ERRO: Senha incorreta.';
      } else if (erro.code == 'invalid-email') {
        mensagem = 'ERRO: Email inválido.';
      } else {
        mensagem = 'ERRO: ${erro.message}';
      }
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$mensagem'), duration: Duration(seconds: 4)));
    });
  }
}
