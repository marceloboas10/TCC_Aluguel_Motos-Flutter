import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TelaMenu extends StatefulWidget {
  @override
  _TelaMenuState createState() => _TelaMenuState();
}

class _TelaMenuState extends State<TelaMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, '/telaLogin');
              }),
        ],
      ),
      backgroundColor: Colors.blueGrey[700],
      body: Container(
        padding: EdgeInsets.all(40),
        child: ListView(children: [
          ListTile(
            leading: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            title: Text(
              'Clientes',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/cadastroCliente');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.two_wheeler_rounded,
              color: Colors.white,
            ),
            title: Text('Veículos',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                )),
            onTap: () {
              Navigator.pushNamed(context, '/cadastroVeiculo');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.device_unknown_rounded,
              color: Colors.white,
            ),
            title: Text('Sobre',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                )),
            onTap: () {
              Navigator.pushNamed(context, '/sobre');
            },
          ),
        ]),
      ),
    );
  }
}
