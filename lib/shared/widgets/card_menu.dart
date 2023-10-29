import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class CardMenu extends StatelessWidget {
  const CardMenu(
      {super.key,
      required this.nomeCard,
      required this.icon,
      required this.navigator});

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: navigator,
              icon: icon,
            ),
            Text(nomeCard),
          ],
        ),
      ),
    );
  }
}
