import 'package:aluguel_moto/cadastroConta.dart';
import 'package:aluguel_moto/form_veiculo.dart';
import 'package:aluguel_moto/prototipo/loginP.dart';
import 'package:aluguel_moto/prototipo/menuP.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:aluguel_moto/cadastroCliente.dart';
import 'package:aluguel_moto/cadastroVeiculo.dart';
import 'package:aluguel_moto/form_cliente.dart';
import 'package:aluguel_moto/telaLogin.dart';
import 'package:aluguel_moto/menu.dart';
import 'package:aluguel_moto/sobre.dart';

Future<void> main() async {
  //Registrar Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    //theme: ThemeData(primarySwatch: Colors.amber),
    initialRoute: '/telaLogin',
    routes: {
      '/telaLogin': (context) => TelaLogin(),
      '/cadastroConta': (context) => CadastroConta(),
      '/menu': (context) => TelaMenu(),
      '/cadastroCliente': (context) => CadastroCliente(),
      '/form_cliente': (context) => FormCliente(),
      '/cadastroVeiculo': (context) => CadastroVeiculo(),
      '/form_veiculo': (context) => FormVeiculo(),
      '/sobre': (context) => Sobre(),
      '/loginP': (context) => LoginP(),
      '/menuP': (context) => MenuP(),
    },
  ));
}
