List<String> fixTheMeerkat(List<String> arr) {
  List<String> array = [];
  for (var i = arr.length - 1; i >= 0; i--) {
    array.add(arr[i]);
  }
  return array;
}

void main(List<String> args) {
  print(fixTheMeerkat(['middle', 'bottom', 'top']));
  print("world");
}
