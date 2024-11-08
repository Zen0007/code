import 'dart:core';
import 'dart:math';

List<List<int>> kprimesStep(int k, int step, int start, int end) {
  List<bool> primes = List<bool>.filled(end + 1, true);
  for (var i = 2; i * i <= end; i++) {
    if (primes[i]) {
      for (var j = i * i; j <= end; j += i) {
        primes[i] = false;
      }
    }
  }
  List<List<int>> pairs = [];
  for (var i = start; i <= end - step; i++) {
    if (primes[i] &&
        countPrime(i) == k &&
        primes[i + step] &&
        countPrime(i + step) == k) {
      pairs.add([i, i + step]);
    }
  }
  return pairs;
}

int countPrime(int n) {
  int count = 0;
  while (n % 2 == 0) {
    count++;
    n ~/= 2;
  }
  for (int i = 3; i <= sqrt(n); i += 2) {
    while (n % i == 0) {
      count++;
      n ~/= i;
    }
  }
  if (n > 2) {
    count++;
  }
  return count;
}

void main(List<String> args) {
  int start = DateTime.now().microsecondsSinceEpoch;
  print(kprimesStep(6, 8, 2, 50));
  int end = DateTime.now().microsecondsSinceEpoch;
  int result = start - end;
  print((result * -1));
}
