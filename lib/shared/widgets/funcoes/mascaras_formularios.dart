import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MascarasFormularios {
  var cpf = MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var telefone = MaskTextInputFormatter(
      mask: '(##)#####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var telefoneResidencial = MaskTextInputFormatter(
      mask: '(##)####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var rg = MaskTextInputFormatter(
      mask: '##.###.###-#',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var cep = MaskTextInputFormatter(
      mask: '#####-###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var validadeCnh = MaskTextInputFormatter(
    mask: '##/##/##',
    filter: {"#": RegExp(r'[0-9]')},
  );
}
