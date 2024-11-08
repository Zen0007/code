void main(List<String> args) {
  int nm = 199988874;
  int n = 0;
  for (var i = 1; i < nm; i++) {
    if (i.isOdd) {
      n += 1;
    }
  }

  int k = 0;
  List.generate(nm, (index) => index % 2 == 1 ? k++ : 0);

  int start = DateTime.now().microsecondsSinceEpoch;
  print('$k //');
  int end = DateTime.now().microsecondsSinceEpoch;
  int result = start - end;
  print(('$result #1'));

  int start1 = DateTime.now().microsecondsSinceEpoch;
  print(oddCount(nm));
  int end1 = DateTime.now().microsecondsSinceEpoch;
  int result1 = start1 - end1;
  print(('${result1 * -1} #2'));

  int start2 = DateTime.now().microsecondsSinceEpoch;
  print('$n ..');
  int end2 = DateTime.now().microsecondsSinceEpoch;
  int result2 = start2 - end2;
  print(('$result2 #3'));
}

int? oddCount(n) {
  return n ~/ 2;
}
