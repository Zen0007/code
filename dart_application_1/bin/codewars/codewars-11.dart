List<int> extraPerfect(int n) {
  List<int> result = [];
  for (var i = 1; i < n + 1; i++) {
    if (!i.isEven) {
      result.add(i);
    }
  }
  return result;
}

List<int> extraPerfect1(int n) => List<int>.generate(
    (n / 2).round(), (index) => !index.isEven ? index : index);

void main(List<String> args) {
  print(extraPerfect1(100));
}
