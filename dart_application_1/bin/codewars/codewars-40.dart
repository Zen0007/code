import 'dart:math';

int evaporator1(double content, double day, double threshold) {
  int days = 0;
  double minCount = 100;
  while (minCount > threshold) {
    minCount -= minCount * (day / 100);
    days++;
  }
  return days;
}

int evaporator2(double content, double evapPerDay, double threshold) {
  int days = 0;
  double minContent = content * (threshold / 100);

  for (double i = content; i > minContent; i -= i * (evapPerDay / 100)) {
    days++;
  }

  return days;
}

int evaporator(double n, double m, double a) {
  return (log(a / 100) / log(1 - m / 100)).ceil();
}

void main(List<String> args) {
  print(evaporator2(10, 10, 5));
}
