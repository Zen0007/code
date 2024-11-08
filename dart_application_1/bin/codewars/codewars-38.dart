List<String> wave1(String str) {
  List<String> text = [];
  List<String> char = str.split('');
  for (var i = 0; i < str.length; i++) {
    if (char[i].contains(RegExp(r'[a-zA-Z]'))) {
      char[i] = char[i].toUpperCase();
      text.add(char.join());
      char[i] = char[i].toLowerCase();
    }
  }
  return text;
}

List<String> wave2(String str) {
  List<String> text = [];
  List<String> char = str.split('');
  int i = 0;
  while (i < char.length) {
    if (isAllphabatic(char[i])) {
      char[i] = char[i].toUpperCase();
      text.add(char.join());
      char[i] = char[i].toLowerCase();
    }
    i++;
  }
  return text;
}

bool isAllphabatic(String a) =>
    (a.codeUnitAt(0) >= 65 && a.codeUnitAt(0) <= 90) ||
    (a.codeUnitAt(0) >= 97 && a.codeUnitAt(0) <= 122);

List<String> wave3(String str) {
  final List<String> result = [];
  for (var i = 0; i < str.length; i++) {
    if (str[i] == '') continue;
    result
        .add(str.substring(0, i) + str[i].toUpperCase() + str.substring(i + 1));
  }
  return result;
}

List<String> wave(String str) {
  List<String> result = [];

  for (var i = 0; i < str.length; i++) {
    if (str[i] != ' ') {
      List<String> chars = str.split('');
      chars[i] = chars[i].toLowerCase();
      result.add(chars.join(''));
    }
  }
  return result;
}

void main(List<String> args) {
  print(wave("HELLO"));
  print(isAllphabatic('hello'));
}
