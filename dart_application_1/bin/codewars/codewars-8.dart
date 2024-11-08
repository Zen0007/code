String? lowerCas1(String txt) {
  int lower = 0;
  int uppare = 0;

  for (var i = 0; i < txt.length; i++) {
    if (txt[i] == txt[i].toLowerCase()) {
      lower++;
    } else {
      uppare++;
    }
  }

  if (lower > uppare) {
    return txt.toLowerCase();
  } else if (lower == uppare) {
    return txt.toLowerCase();
  } else {
    return txt.toUpperCase();
  }
}

String lowerCas(String txt) {
  int upper = 0;
  int lower = 0;
  for (var i = 0; i < txt.length; i++) {
    (txt[i] == txt[i].toLowerCase() ? lower++ : upper++);
  }

  return upper > lower ? txt.toUpperCase() : txt.toLowerCase();
}

String solve(String str) {
  return RegExp(r'[A-Z]').allMatches(str).length >
          RegExp(r'[a-z]').allMatches(str).length
      ? str.toUpperCase()
      : str.toLowerCase();
}

String solve1(String s) {
  List<String> split = s.split('');
  int lowercase =
      split.fold(0, (acc, item) => item.toLowerCase() == item ? acc + 1 : acc);
  int uppercase =
      split.fold(0, (acc, item) => item.toUpperCase() == item ? acc + 1 : acc);
  return uppercase <= lowercase ? s.toLowerCase() : s.toUpperCase();
}

String solve2(String s) {
  bool isUppercase(String value) => value.toUpperCase() == value;

  if (s.split('').where(isUppercase).length > s.length / 2) {
    return s.toUpperCase();
  }
  return s.toLowerCase();
}

void main(List<String> args) {
  print(solve('COdeD REX rizan febriana dewan '));
}
