List<int> array2(List<int> list) {
  Map<int, int> countMap = {};
  for (int num in list) {
    countMap[num] = (countMap[num] ?? 0) + 1;
  }
  List<int> result = [];
  for (int num in list) {
    if (countMap[num]! % 2 == 0) {
      result.add(num);
    }
  }
  return result;
}

List<int> array1(List<int> n) {
  List<int> hasil = [];
  for (var i = 0; i < n.length; i++) {
    if (n[i] % 2 == 0) {
      hasil.add(n[i]);
    }
  }
  return hasil;
}

List<int> array3(List<int> arr) => arr
    .where(
        (element) => arr.where((n) => n == element).length.isEven) // % 2 == 0
    .toList();

List<int> array(List<int> n) {
  Map<int, int> number = n.fold({}, (previousValue, element) {
    previousValue[element] = (previousValue[element] ?? 0) + 1;
    return {...previousValue};
  });
  return n.where((element) => number[element]!.isEven).toList();
}

void main(List<String> args) {
  print(array([26, 23, 24, 17, 23, 24, 23, 26]));
  print(array([1, 1, 2, 2, 3, 3, 3]));
}
