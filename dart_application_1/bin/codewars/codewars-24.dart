import 'dart:math';

String rgb1(int r, int g, int b) {
  String hex = '#';
  hex += (r > 255)
      ? 'FF'
      : (r < 0)
          ? '00'
          : r.toRadixString(16).padLeft(2, '0');
  hex += (g > 255)
      ? 'FF'
      : (g < 0)
          ? '00'
          : g.toRadixString(16).padLeft(2, '0');
  hex += (b > 255)
      ? 'FF'
      : (b < 0)
          ? '00'
          : b.toRadixString(16).padLeft(2, '0');
  return hex.toUpperCase();
}

String rgb(int r, int g, int b) {
  var _r = max(0, min(255, r)).toRadixString(16).padLeft(2, '0').toUpperCase();
  var _g = max(0, min(255, g)).toRadixString(16).padLeft(2, '0').toUpperCase();
  var _b = max(0, min(255, g)).toRadixString(16).padLeft(2, '0').toUpperCase();
  return '#${_r}${_g}${_b}';
}

void main(List<String> args) {
  print(rgb(0, 883, 55));
}
