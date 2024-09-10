import 'package:flutter/material.dart';
import '../constantes/constants.dart';

class CardMenu extends StatelessWidget {
  const CardMenu(
      {super.key,
      required this.cor,
      required this.nomeCard,
      required this.icon,
      required this.navigator});

  final Color cor;
  final String nomeCard;
  final Widget icon;
  final VoidCallback navigator;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(kDefaultPadding),
      child: Container(
        width: 150,
        height: 150,
        color: cor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: navigator,
              icon: icon,
              iconSize: 38,
              color: Colors.white,
            ),
            Text(
              nomeCard,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
