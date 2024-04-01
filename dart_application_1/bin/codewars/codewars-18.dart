List<int> solve1(n, y) => List<int>.generate(y - n + 1, (index) => n + index);

List<int> solve2(a, b) {
  return [for (var i = a; i <= b; i++) i];
}

List<int> solve3(a, b) {
  List<int> result = [];
  for (var i = a; i <= b; i++) {
    result.add(i);
  }
  return result;
}

List<int> solve(a, b) {
  List<int> result = [];
  int i = a;
  while (i <= b) {
    result.add(i);
    i++;
  }
  return result;
}

void main(List<String> args) {
  print(solve(6, 7));
}
