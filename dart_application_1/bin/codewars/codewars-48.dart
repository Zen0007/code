String solution(str) {
  String string = '';
  for (var i = str.length - 1; i >= 0; i--) {
    string += str[i];
  }
  return string;
}

void main(List<String> args) {
  print(solution(""));
}
