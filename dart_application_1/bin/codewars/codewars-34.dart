String oddOrEven1(List<int> array) {
  int sum = array.reduce((a, b) {
    return b >= 0 ? a + b : a;
  });
  return sum.isEven ? "even" : "odd";
}

String oddOrEven(List<int> array) => array.fold(0, (int a, int b) {
      return a + b;
    }).isEven
        ? "even"
        : "odd";

String oddOrEven2(List<int> array) {
  int sum = 0;
  for (var i in array) {
    sum += i;
  }
  return sum.isEven ? "even" : "odd";
}

void main() {
  print(oddOrEven([20, 99]));
}
