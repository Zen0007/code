import 'package:collection/collection.dart';

int max1(List<int> n) {
  int maxProduct = n[0] * n[1];
  print("${maxProduct}/");
  for (int i = 0; i < n.length - 1; i++) {
    int product = n[i] * n[i + 1];
    print("${product}?");
    if (product > maxProduct) {
      maxProduct = product;
    }
  }
  return maxProduct;
}

int max2(n) =>
    //(List.generate(ar.length - 1, (i) => ar[i] * ar[i + 1])..sort()).last;
    (List.generate(n.length - 1, (index) => n[index] * n[index + 1])..sort())
        .last;

int max3(n) {
  return ([for (var i = 0; i < n.length - 1; i++) n[i] * n[i + 1]]..sort())
      .last;
}

int max4(List<int> n) {
  return n
      .mapIndexed((index, element) =>
          element * (index + 1 == n.length ? n[index - 1] : n[index + 1]))
      .toList()
      .reduce((value, element) => value > element ? value : element);
}

int max(List<int> n) => n
    .where((element) => n.indexOf(element) < n.length - 1)
    .map((e) => e * n[n.indexOf(e) + 1])
    .toList()
    .reduce((value, element) => value > element ? value : element);

void main(List<String> args) {
  final arr = [-1, -2, 3];
  //.where((element) => indexOf(element) < n.length - 1)
  //print(max([9, 5, 10, 2, 24, -1, -48]));
  print(arr.where((element) => arr.indexOf(element) < arr.length - 1).map((e) =>
      e *
      arr[arr.indexOf(e) + 1])); //(529, 16, 25, 9801, 729, 108241, 4, 49) no +1
  print(max(arr));
}
