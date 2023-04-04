import 'package:flutter/material.dart';

class CamposFormulario extends StatelessWidget {
  final String nomeLabel;
  final nomeCampo;
  final keyboardType;
  final inputFormato;

  CamposFormulario(
      {Key? key,
      required this.nomeLabel,
      required this.nomeCampo,
      this.keyboardType,
      this.inputFormato})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 165,
      child: TextField(
        controller: nomeCampo,
        style: TextStyle(color: Colors.black, fontSize: 18),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: nomeLabel,
          labelStyle: TextStyle(color: Colors.black, fontSize: 16),
        ),
        keyboardType: keyboardType,
        inputFormatters: [],
      ),
    );
  }
}
