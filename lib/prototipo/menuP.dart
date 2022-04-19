import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MenuP extends StatefulWidget {
  @override
  _MenuPState createState() => _MenuPState();
}

class _MenuPState extends State<MenuP> {
  @override
  Widget build(BuildContext context) {
    //Menu Drawer
    final drawerHeader = UserAccountsDrawerHeader(
      accountName: Text('Marcelo Vilas Boas'),
      accountEmail: Text('marcelo.boas@fatec.sp.gov.br'),
      decoration: BoxDecoration(color: Colors.purple[700]),
      currentAccountPicture: CircleAvatar(
        child: FlutterLogo(size: 42.0),
        backgroundColor: Colors.white,
      ),
    );
    final drawerItems = ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        drawerHeader,
        ListTile(
          leading: Icon(
            Icons.account_circle,
            color: Colors.black,
          ),
          title: Text(
            'Clientes',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          onTap: () => Navigator.pushNamed(context, '/cadastroCliente'),
        ),
        ListTile(
          leading: Icon(
            Icons.motorcycle,
            color: Colors.black,
          ),
          title: Text(
            'Veículos',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          onTap: () => Navigator.pushNamed(context, '/cadastroVeiculo'),
        ),
        ListTile(
          leading: Icon(
            Icons.alarm_outlined,
            color: Colors.black,
          ),
          title: Text(
            'Lembretes',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          onTap: () => Navigator.pushNamed(context, ''),
        ),
        ListTile(
          leading: Icon(
            Icons.monetization_on_outlined,
            color: Colors.black,
          ),
          title: Text(
            'Pagamentos',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          onTap: () => Navigator.pushNamed(context, ''),
        ),
        ListTile(
          leading: Icon(
            Icons.support_agent,
            color: Colors.black,
          ),
          title: Text(
            'Suporte',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          onTap: () => Navigator.pushNamed(context, '/sobre'),
        ),
      ],
    );
    return Scaffold(
      drawer: Drawer(
        child: drawerItems,
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
      body: Container(
        padding: EdgeInsets.all(40),
        child: ListView(children: [
          ListTile(
            leading: Icon(
              Icons.account_circle,
              color: Colors.black87,
            ),
            title: Text(
              'Clientes',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black87,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/cadastroCliente');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.two_wheeler_rounded,
              color: Colors.black87,
            ),
            title: Text('Veículos',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black87,
                )),
            onTap: () {
              Navigator.pushNamed(context, '/cadastroVeiculo');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.support_agent,
              color: Colors.black87,
            ),
            title: Text('Suporte',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black87,
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
