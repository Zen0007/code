//(n * (n + 1)) / 2 * ((2 * n) + 1) / 6
int sumCubes1(int n) {
  int sum = 0;
  for (var i = 1; i <= n; i++) {
    sum += i * i * i;
  }
  return sum;
}

int sumCubes(int n) {
  return [for (var i = 1; i <= n; i++) i * i * i]
      .reduce((value, element) => value + element);
}

void main(List<String> args) {
  print(sumCubes(5));
}
