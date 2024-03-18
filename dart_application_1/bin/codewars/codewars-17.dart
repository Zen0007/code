import 'dart:math';

int friends(List<int> n) {
  Map<int, int> f = {};
  for (var i in n) {
    f[i] = (f[i] ?? 0) + 1;
  }
  int result = n.firstWhere((element) => f[element]! < n.length / 2);
  return result;
}

void main(List<String> args) {
  print(friends([17, 17, 3, 17, 17, 17, 17]));
}
