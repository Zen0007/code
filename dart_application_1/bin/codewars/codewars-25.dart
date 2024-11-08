List<List<int>> arr1(int n) {
  List<List<int>> inList = [];
  for (var i = 0; i < n; i++) {
    List<int> listInt = [];
    for (var j = 0; j <= i; j++) {
      listInt.add(1);
    }
    inList.add(listInt);
  }
  return inList;
}

List<List<int>> arr2(int n) =>
    List.generate(n, (index) => List.filled(index + 1, 1));

List<List<int>> arr(int n) =>
    List.generate(n, (index) => List.generate(index + 1, (i) => 1));

List<List<int>> arr4(int n) {
  List<List<int>> list = [];
  List<int> indexList = [];
  for (var i = 1; i <= n; i++) {
    if (n == 0) break;
    indexList.add(1);
    list.add([...indexList]);
  }
  return list;
}

void main(List<String> args) {
  print(arr2(9));
}
