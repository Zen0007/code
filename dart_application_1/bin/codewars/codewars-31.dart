num sum(List<num> arr) {
  if (arr.length <= 0) {
    return 0;
  } else {
    return arr.reduce((value, element) => value + element);
  }
}

num sum1(List<num> n) => n.length <= 0 ? 0 : n.fold(0, (a, b) => a + b);

void main(List<String> args) {
  print(sum([3.4, 4.4, 2.4]));
}
