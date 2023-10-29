import 'package:flutter/material.dart';


class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    super.key,
    required this.drawerHeader,
  });

  final UserAccountsDrawerHeader drawerHeader;

  @override
  Widget build(BuildContext context) {
    return ListView(
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
            Icons.monetization_on_outlined,
            color: Colors.black,
          ),
          title: Text(
            'Multas',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          onTap: () => Navigator.pushNamed(context, ''),
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
          onTap: () => Navigator.pushNamed(context, '/cadastroLembretes'),
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
  }
}
