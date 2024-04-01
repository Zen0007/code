int checkChoose1(int m, n) {
  if (n > m) return -1;
  for (int x = 1; x <= n; x++) {
    int combinations = 1;
    for (int i = 0; i < x; i++) {
      combinations *= (n - i) as int;
      combinations ~/= i + 1;
    }
    if (combinations == m) return x;
  }
  return -1;
}

int checkChoose2(int m, n) {
  var x = 1;
  for (var i = 1; i <= n; i++) {
    x = (x * (n + 1 - i)) ~/ i;
    if (x == m) {
      return i;
    }
  }
  return -1;
}

int checkChoose(int m, n) {
  var result = 1;
  int i = 0;
  while (i <= n) {
    if (result == m) return i;
    result = result * (n - i) ~/ (i + 1);
    i += 1;
  }
  return -1;
}

void main(List<String> args) {
  print(checkChoose(100, 4));
  print(checkChoose(47129212243960, 50));
}
