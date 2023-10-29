String boasVindas() {
  var now = DateTime.now();
  var hour = now.hour;
  String saudacao = '';

  if (hour >= 6 && hour < 12) {
    saudacao = 'Bom dia!';
  } else if (hour >= 12 && hour < 18) {
    saudacao = "Boa tarde!";
  } else {
    saudacao = "Boa noite!";
  }
  return saudacao;
}
