void main(List<String> args) {
  print(productArray1([10, 80]));
}

List<int> prodExcept(List<int> arr) {
  int n = arr.length;
  List<int> prod = List<int>.filled(n, 1);

  int left = 1;
  for (var i = 0; i < n; i++) {
    prod[i] *= left;
    left *= arr[i];
  }

  int ringt = 1;
  for (var i = n - 1; i >= 0; i--) {
    prod[i] *= ringt;
    ringt *= arr[i];
  }
  return prod;
}

List<int> productArray(List<int> arr) {
  List<int> prond = [];

  for (var nums in arr) {
    List<int> temp = List.from(arr)..remove(nums);
    prond.add(temp.reduce((value, element) => value * element));
  }
  return prond;
}

List<int> productArray1(List<int> arr) {
  List<int> list = [];
  int n = 1;
  for (var i = 0; i < arr.length; i++) {
    for (var j = 0; j < arr.length; j++) {
      print(j);
      print(i);
      if (i != j) n *= arr[j];
      print(n * arr[j]);
    }
    list.add(n);
    n = 1;
  }
  return list;
}
