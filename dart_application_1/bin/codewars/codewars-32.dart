String factortial1(int i) {
  List<int> count = [];
  int n = i;
  while (n != 0) {
    count.add(n % 10);
    n ~/= 10;
  }
  int factortial = 0;
  for (var j in count) {
    int f = 1;
    for (var k = 1; k <= j; k++) {
      f *= k;
    }
    factortial += f;
  }
  return factortial == i ? "STRONG!!!!" : "Not Strong !!";
}

String factortial(n) {
  return n
              .toString()
              .split('')
              .map((e) => List.generate(int.parse(e), (index) => index + 1)
                  .fold(1, (a, b) => a * b))
              .reduce((value, element) => value + element) ==
          n
      ? "STRONG!!!!"
      : "Not Strong !!";
}

void main(List<String> args) {
  print(factortial1(145));
  print(factortial1(90));
  print(factortial(185));
}
