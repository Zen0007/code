String evenOrOdd1(int a) => (-1 * a) % 2 == 0 ? 'even' : 'odd';
String evenOrOdd2(int a) => a.isEven ? 'even' : 'odd';
String evenOrOdd(int a) {
  return ['even', 'odd'][a % 2];
}

void main(List<String> args) {
  int n = -6;
  print(n.isEven);
  print(evenOrOdd(-1));
}
