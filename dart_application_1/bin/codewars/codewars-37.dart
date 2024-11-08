int minPairSum1(List<int> n) {
  n.sort();
  num mint = 0;
  for (var i = 0; i < n.length ~/ 2; i++) {
    mint += n[i] * n[n.length - i - 1];
  }
  return mint.toInt();
}

int minPairSum(List<int> l) {
  l.sort();
  int langeth = l.length - 1;
  int sum = 0;
  List<int> arr = [];
  while (sum < langeth) {
    arr.add(l[sum] * l[langeth]);
    langeth--;
    sum++;
  }
  return arr.fold(0, (a, b) => a + b);
}

void main(List<String> args) {
  print(minPairSum([12, 6, 10, 26, 3, 24]));
  print(minPairSum([5, 4, 2, 3]));
}
//https://www.codewars.com/kata/5a523566b3bfa84c2e00010b