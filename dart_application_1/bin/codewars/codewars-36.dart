void main(List<String> args) {
  List<int> m = [1, 2];
  for (var i = 0; i <= m.length; i++) {
    if (m[i] == m[i + 1]) {
      print(i);
    }
  }
}
