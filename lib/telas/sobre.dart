import 'dart:ui';

import 'package:flutter/material.dart';

class Sobre extends StatefulWidget {
  @override
  _SobreState createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepOrange,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('lib/imagens/marcelo.jpg'),
                radius: 80,
              ),
              Divider(),
              Text(
                'Marcelo Vilas Boas',
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Verdana',
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Desenvolvedor Flutter',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Times New Roman',
                    color: Colors.deepOrange.shade100,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
                width: 250,
                child: Divider(
                  color: Colors.deepOrange.shade100,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 28,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    size: 25,
                    color: Colors.deepOrange,
                  ),
                  title: Text(
                    '(16)99135-4260',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontFamily: 'SourceSensPro',
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 28),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.deepOrange,
                    size: 25,
                  ),
                  title: Text(
                    'marcelo.boas@fatec.sp.gov.br',
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 18,
                        fontFamily: 'SourceSansPro,'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
