import 'package:aluguel_moto/shared/constants.dart';
import 'package:aluguel_moto/shared/widgets/funcoes/saudacao.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../shared/widgets/card_menu.dart';

class MenuInicial extends StatefulWidget {
  const MenuInicial({
    super.key,
  });

  @override
  State<MenuInicial> createState() => _MenuInicialState();
}

class _MenuInicialState extends State<MenuInicial> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          height: size.height * 0.12,
          width: size.width * 0.9,
          child: Row(
            children: [
              Text(
                boasVindas(),
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: kTextColor),
              )
            ],
          ),
        ),
        Row(
          children: [
            CardMenu(
              nomeCard: 'Clientes',
              icon: FaIcon(FontAwesomeIcons.userGroup),
              navigator: () {
                Navigator.pushNamed(context, '/cadastroCliente');
              },
            ),
            CardMenu(
              nomeCard: 'Veiculos',
              icon: FaIcon(FontAwesomeIcons.motorcycle),
              navigator: () {
                Navigator.pushNamed(context, '/cadastroVeiculo');
              },
            ),
          ],
        ),
        Row(
          children: [
            CardMenu(
              nomeCard: 'Pagamentos',
              icon: FaIcon(FontAwesomeIcons.creditCard),
              navigator: () {},
            ),
            CardMenu(
              nomeCard: 'Multas',
              icon: FaIcon(FontAwesomeIcons.envelopesBulk),
              navigator: () {},
            ),
          ],
        ),
        Row(
          children: [
            CardMenu(
              nomeCard: 'Revisão',
              icon: FaIcon(FontAwesomeIcons.a),
              navigator: () {},
            ),
            CardMenu(
              nomeCard: 'Lembretes',
              icon: FaIcon(FontAwesomeIcons.accessibleIcon),
              navigator: () {
                Navigator.pushNamed(context, '/cadastroLembretes');
              },
            ),
          ],
        )
      ],
    );
  }
}

// MENU ANTIGO
// Container(
//       padding: EdgeInsets.all(40),
//       child: ListView(
//         children: [
//           ListTile(
//             leading: Icon(
//               Icons.account_circle,
//               color: Colors.black87,
//             ),
//             title: Text(
//               'Clientes',
//               style: TextStyle(
//                 fontSize: 25,
//                 color: Colors.black87,
//               ),
//             ),
//             onTap: () {
//               Navigator.pushNamed(context, '/cadastroCliente');
//             },
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.two_wheeler_rounded,
//               color: Colors.black87,
//             ),
//             title: Text('Veículos',
//                 style: TextStyle(
//                   fontSize: 25,
//                   color: Colors.black87,
//                 )),
//             onTap: () {
//               Navigator.pushNamed(context, '/cadastroVeiculo');
//             },
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.support_agent,
//               color: Colors.black87,
//             ),
//             title: Text('Suporte',
//                 style: TextStyle(
//                   fontSize: 25,
//                   color: Colors.black87,
//                 )),
//             onTap: () {
//               Navigator.pushNamed(context, '/sobre');
//             },
//           ),
//         ],
//       ),
//     );
