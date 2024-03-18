import 'dart:math';

int? rowSumOddNumbers1(int n) {
  return pow(n, 3).toInt();
}

int rowSumOddNumbers(int n) {
  List<List<int>> list = [];
  int a = 1;
  int b = 0;
  for (var i = 0; i < n; i++) {
    list.add([]);
    for (var j = 0; j <= i; j++) {
      if (i != 0) a += 2;
      list[i].add(a);
    }
  }
  b = list[n - 1].fold(0, (previousValue, element) => previousValue + element);
  return b;
}

void main(List<String> args) {
  print(rowSumOddNumbers(13));
}
