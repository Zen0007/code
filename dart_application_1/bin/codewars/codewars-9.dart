int? quarter(int month) {
  // return the quarter for this `month`
  if (month == 3) {
    return 1;
  }
  int res = month ~/ 3;
  return res + 1;
}

int? quarter1(int month) => (month / 3).ceil();

void main(List<String> args) {
  print(quarter1(11));
}
