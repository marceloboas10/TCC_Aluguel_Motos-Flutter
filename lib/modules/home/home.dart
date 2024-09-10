import 'package:aluguel_moto/modules/menu/menu_inicial.dart';
import 'package:aluguel_moto/shared/constantes/constants.dart';
import 'package:aluguel_moto/shared/widgets/menu_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Menu Drawer
  final drawerHeader = UserAccountsDrawerHeader(
    accountName: Text('Marcelo Vilas Boas'),
    accountEmail: Text('marcelo.boas@fatec.sp.gov.br'),
    decoration: BoxDecoration(color: Colors.cyan[600]),
    currentAccountPicture: CircleAvatar(
      child: FlutterLogo(size: 42.0),
      backgroundColor: Colors.white,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: MenuDrawer(drawerHeader: drawerHeader),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'MOTAPP',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, '/telaLogin');
                }),
          ],
        ),
        backgroundColor: Colors.white,
        body: MenuInicial());
  }
}
