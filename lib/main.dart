import 'package:aluguel_moto/shared/cadastros/cadastro_conta.dart';
import 'package:aluguel_moto/shared/formularios/form_veiculo.dart';
import 'package:aluguel_moto/modules/home/home.dart';
import 'package:aluguel_moto/modules/sobre/sobre.dart';
import 'package:aluguel_moto/modules/login/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:aluguel_moto/shared/cadastros/cadastro_cliente.dart';
import 'package:aluguel_moto/shared/cadastros/cadastro_veiculo.dart';
import 'package:aluguel_moto/shared/formularios/form_cliente.dart';
import 'shared/cadastros/cadastro_lembretes.dart';

Future<void> main() async {
  //Registrar Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        
        //colorScheme: ColorScheme.fromSeed(seedColor: kTextColor),
        appBarTheme: AppBarTheme(backgroundColor: Colors.amber)),
    initialRoute: '/home_page',
    routes: {
      '/telaLogin': (context) => LoginPage(),
      '/cadastroConta': (context) => CadastroConta(),
      '/home_page': (context) => Home(),
      //'/menu': (context)=> TelaMenu(),
      '/cadastroCliente': (context) => CadastroCliente(),
      '/form_cliente': (context) => FormCliente(),
      '/cadastroVeiculo': (context) => CadastroVeiculo(),
      '/form_veiculo': (context) => FormVeiculo(),
      '/cadastroLembretes': (context) => CadastroLembretes(),
      '/sobre': (context) => Sobre(),
      '/cadastro': (context) => TelaCadastro(),
    },
  ));
}
