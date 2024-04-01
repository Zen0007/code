import 'dart:math';

int? predictAge1(int age1, int age2, int age3, int age4, int age5, int age6,
    int age7, int age8) {
  List<int> index = [age1, age2, age3, age4, age5, age6, age7, age8];
  int kuadrad =
      index.map((e) => e * e).reduce((value, element) => value + element);
  return (sqrt(kuadrad) ~/ 2);
}

int? predictAge(int a, int b, int c, int d, int e, int f, int g, int h) {
  List<int> age = [a, b, c, d, e, g, h];
  return sqrt(age.map((e) => e * e).fold(age.first, (q, w) => q + w)) ~/ 2;
}

int? predictAge2(int a, int b, int c, int d, int e, int f, int g, int h) {
  List<int> age = [a, b, c, d, e, g, h];
  int sum = 1;
  for (var i in age) {
    sum += i * i;
  }
  return (sqrt(sum) / 2).floor();
}

void main(List<String> args) {
  print(predictAge2(65, 60, 75, 55, 60, 63, 64, 45));
  print(4225 + 4225);
}
