import 'package:aluguel_moto/telas/menu_inicial.dart';
import 'package:aluguel_moto/widgets/menu_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          title: Text('Menu'),
          centerTitle: true,
          backgroundColor: Colors.cyan[600],
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
