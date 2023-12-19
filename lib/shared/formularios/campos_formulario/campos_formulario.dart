import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CamposFormulario extends StatelessWidget {
  final String nomeLabel;
  final nomeCampo;
  final keyboardType;
  final TextInputFormatter inputFormato;
  final String? message;

  CamposFormulario(
      {Key? key,
      required this.nomeLabel,
      required this.nomeCampo,
      this.keyboardType,
      required this.inputFormato,
      this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: TextFormField(
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return message;
          }
          return null;
        },
        controller: nomeCampo,
        style: TextStyle(color: Colors.black, fontSize: 18),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: nomeLabel,
          labelStyle: TextStyle(color: Colors.black, fontSize: 16),
        ),
        keyboardType: keyboardType,
        inputFormatters: [inputFormato],
      ),
    );
  }
}
