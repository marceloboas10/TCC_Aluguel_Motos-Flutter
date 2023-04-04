import 'package:aluguel_moto/cadastros/cadastroConta.dart';
import 'package:aluguel_moto/formularios/form_veiculo.dart';
import 'package:aluguel_moto/telas/menu.dart';
import 'package:aluguel_moto/telas/sobre.dart';
import 'package:aluguel_moto/telas/telaLogin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:aluguel_moto/cadastros/cadastroCliente.dart';
import 'package:aluguel_moto/cadastros/cadastroVeiculo.dart';
import 'package:aluguel_moto/formularios/form_cliente.dart';
import 'cadastros/cadastroLembretes.dart';


Future<void> main() async {
  //Registrar Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    //theme: ThemeData(primarySwatch: Colors.amber),
    initialRoute: '/menu',
    routes: {
      '/telaLogin': (context) => TelaLogin(),
      '/cadastroConta': (context) => CadastroConta(),
      '/menu': (context)=> TelaMenu(),
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
