//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginP extends StatefulWidget {
  @override
  _LoginPState createState() => _LoginPState();
}

class _LoginPState extends State<LoginP> {
/*

  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
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
            duration: Duration(seconds: 4)
          )
        );
    });
  }
}
*/

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 128,
              height: 128,
              child: Image.asset('lib/imagens/logo.png'),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              //autofocus: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'E-mail',
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              //autofocus: true,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text(
                  "Recuperar Senha",
                  textAlign: TextAlign.right,
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [Color(0xFFF58524), Color(0xFFF92B7f)],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  )),
            ),
            SizedBox(
              height: 120,
            ),
            Container(
              child: Text(
                "Teste",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
