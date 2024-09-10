import 'package:aluguel_moto/shared/constantes/constants.dart';
import 'package:aluguel_moto/shared/funcoes/saudacao.dart';
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CardMenu(
              nomeCard: 'Clientes',
              cor: Colors.orange,
              icon: FaIcon(FontAwesomeIcons.userGroup),
              navigator: () {
                Navigator.pushNamed(context, '/cadastroCliente');
              },
            ),
            CardMenu(
              nomeCard: 'Veículos',
              cor: Colors.blue,
              icon: FaIcon(FontAwesomeIcons.motorcycle),
              navigator: () {
                Navigator.pushNamed(context, '/cadastroVeiculo');
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CardMenu(
              nomeCard: 'Pagamentos',
              cor: Colors.green,
              icon: FaIcon(FontAwesomeIcons.creditCard),
              navigator: () {},
            ),
            CardMenu(
              nomeCard: 'Multas',
              cor: Colors.pink,
              icon: FaIcon(FontAwesomeIcons.envelopesBulk),
              navigator: () {},
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CardMenu(
              nomeCard: 'Revisão',
              cor: Colors.red,
              icon: FaIcon(FontAwesomeIcons.a),
              navigator: () {},
            ),
            CardMenu(
              nomeCard: 'Lembretes',
              cor: Colors.deepPurple,
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
