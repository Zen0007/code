import "dart:math";

String disariumNumber(int n) {
  String solution1(int n) {
    String s = "$n";
    int count = 0;
    for (int i = 0; i < s.length; ++i) {
      count += pow(int.parse(s[i]), i + 1).toInt();
    }
    return count != n ? 'Not !!' : 'Disarium !!';
  }

  String solution2(int n) {
    int nn = n;
    int count = 0;
    int i = n.toString().length;
    while (nn != 0) {
      count += pow((nn.remainder(10)), i).toInt();
      nn ~/= 10;
      i--;
    }
    return count != n ? 'Not !!' : 'Disarium !!';
  }

  String solution3(int n) {
    String s = n.toString();
    List<String> ss = s.split('');
    int c = ss
        .asMap()
        .map((i, v) => MapEntry(i, pow(int.parse(v), i + 1)))
        .values
        .reduce((p, e) => int.parse(p.toString()) + int.parse(e.toString()))
        .toInt();
    return c != n ? 'Not !!' : 'Disarium !!';
  }

  Random r = Random(3);

  return [solution1(n), solution2(n), solution3(n)][r.nextInt(3)];
}

String disariumNumber1(n) => n ==
        n
            .toString()
            .split('')
            .asMap()
            .map((i, el) => MapEntry(i, pow(int.parse(el), i + 1)))
            .values
            .reduce((v, el) => v + el)
    ? "Automorphic"
    : "Not!!";

String disarium(int n) => (n * n) % 2 == 0 ? "Disarium !!" : "Not !!";

void main(List<String> args) {
  print(disariumNumber1(625));
}
