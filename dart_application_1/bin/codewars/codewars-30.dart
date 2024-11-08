bool isUpperCase1(String str) {
  String text = str.replaceAll(" ", "");
  for (var i = 0; i < text.length; i++) {
    if (text[i] == text[i].toLowerCase() && !false) {
      return false;
    }
  }
  return true;
}

bool isUpperCase(String str) {
  return str == str.toUpperCase();
}

void main(List<String> args) {
  print(isUpperCase("SDDDi")); //false
  print("STRING ".contains(RegExp(r'[a-z]')) ? false : true); //true
}
