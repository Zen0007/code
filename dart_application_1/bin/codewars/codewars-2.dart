int? descendingOrder1(n) {
  var result = [];
  var list = n.toString().split('').toList();
  for (var i in list) {
    result.add(int.parse(i));
  }
  result.sort();
  return int.parse(result.reversed.join());
}

int descendingOrder(n) {
  var str = n.toString();
  var list = str.split('');

  for (int i = 0; i < list.length; i++) {
    for (var j = list.length - 1; j > i; j--) {
      int fist = int.parse(list[j]);
      int last = int.parse(list[j - 1]);
      if (fist > last) {
        list[j - 1] = fist.toString();
        list[j] = last.toString();
      }
    }
  }
  return int.parse(list.join(''));
}

void main() {
  print(descendingOrder(1222));
}
