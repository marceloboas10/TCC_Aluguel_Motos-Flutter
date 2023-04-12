void saudacao(){
var now = DateTime.now();
  var hour = now.hour;

  if (hour >= 6 && hour < 12) {
    print("Bom dia");
  } else if (hour >= 12 && hour < 18) {
    print("Boa tarde");
  } else {
    print("Boa noite");
  }
}
