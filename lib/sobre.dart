import 'package:flutter/material.dart';

class Sobre extends StatefulWidget {
  @override
  _SobreState createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey[500],
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: <Widget>[
              Image.asset('lib/imagens/marcelo.jpg', height: 169,),
              Text('Marcelo Henrique Vilas Boas', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),),
              Divider(),
              Text('Projeto de TCC - Aplicativo para gestão de aluguel de motos desenvolvido em linguagem Flutter.\n\n'
              'Curso: Análise e Desenvolvimento de Sistemas - FATEC Ribeirão Preto.\n\n'
              'Disciplina: Programação Para Dispositivos Móveis', style: TextStyle(fontSize: 20,),),
            ],
          ),
        ),
      ),
    );
  }
}