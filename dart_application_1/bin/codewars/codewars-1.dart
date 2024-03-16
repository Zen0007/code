/// trail error

int? list1(List nu) {
  List<int> even = [];
  List<int> odd = [];
  nu.forEach(
      (element) => (element.isEven) ? even.add(element) : odd.add(element));
  return (even.length == 1) ? even[0] : odd[0];
}

int? list2(List nu) => nu.firstWhere(
    nu.getRange(0, 3).where((element) => element % 2 == 0).length > 1
        ? (i) => i % 2 == 1
        : (i) => i % 2 == 0);

int? list3(List nu) => nu.where((element) => element.isEven).length == 1
    ? nu.firstWhere((element) => element.isEven)
    : nu.firstWhere((element) => element.isOdd);

int list(List nu) {
  var even = nu.where((element) => element.isEven);
  var odd = nu.where((element) => element.isOdd);
  return even.length == 1 ? even.first : odd.first;
}

void main(List<String> args) {
  print(list([2, 4, 0, 100, 4, 11, 2602, 36]));
}
