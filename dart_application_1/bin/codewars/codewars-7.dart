import 'dart:math';

bool? isSquare1(int n) {
  if (n < 0) {
    return false;
  } else if (n == 0) {
    return true;
  }
  for (var i = 1; i * i <= n; i++) {
    if (i * i == n) {
      return true;
    }
  }
  return false;
}

bool? isSquare2(n) => sqrt(n) % 1 == 0;

bool isSquare(n) {
  for (var i = 0; i <= n; i++) {
    if (i * i == n) {
      return true;
    }
  }
  return false;
}

void main(List<String> args) {
  print(isSquare(0));
}
