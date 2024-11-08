int century(year) {
  var result;
  if (year <= 100) {
    result = 1;
  } else {
    result = (year - 1) ~/ 100 + 1;
  }
  return result;
}

int century1(y) => y <= 1 == 100 ? 1 : (y - 1) ~/ 100 + 1;

int century2(y) => (y + 99) ~/ 100;

void main(List<String> args) {
  print(century2(1920));
}
