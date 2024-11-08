String? middleTxt(String txt) {
  int middleTxt = (txt.length / 2).toInt();
  print(middleTxt + 1);
  print(middleTxt - 1);
  print(middleTxt);
  return txt.length % 2 == 0
      ? txt.substring(middleTxt - 1, middleTxt + 1)
      : txt.substring(middleTxt, middleTxt + 1);
}

String getMiddle(String s) {
  if (s.length % 2 == 0) {
    var startIndex = (s.length ~/ 2) - 1;
    var endIndex = (s.length ~/ 2) + 1;
    return s.substring(startIndex, endIndex);
  } else if (s.length == 1) {
    return s;
  } else {
    var startIndex = s.length ~/ 2;
    var endIndex = (s.length ~/ 2) + 1;
    return s.substring(startIndex, endIndex);
  }
}

String getMiddle1(String s) {
  if (s.length % 2 == 0) {
    return s[s.length ~/ 2 - 1] + s[s.length ~/ 2];
  } else {
    return s[s.length ~/ 2];
  }
}

void main() {
  print(getMiddle('hello||Word'));
}
