import 'dart:math';

double areaOfPolygonInsideCircle1(double r, int n) =>
    (0.5 * n * r * r * sin(2 * pi / n) * 1000).round() / 1000;

double? areaOfPolygonInsideCircle2(double r, int n) {
  double area = n / 2 * r * r * sin(2 * pi / n);
  print(area);
  String stringArea = area.toStringAsFixed(3);
  print(stringArea);
  double res = double.parse(stringArea);
  print(res);
  return res;
}

double areaOfPolygonInsideCircle(double r, int n) {
  double areaCirculate = 2 * pi / n;
  print(areaCirculate);
  double area = (n * r * r * sin(areaCirculate)) / 2;
  print(area);
  return double.parse(area.toStringAsFixed(3));
}

void main(List<String> args) {
  print(areaOfPolygonInsideCircle1(9.76, 300));
}
