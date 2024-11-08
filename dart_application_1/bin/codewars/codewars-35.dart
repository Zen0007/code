String latestClock1(int a, int b, int c, int d) {
  List<int> number = [a, b, c, d];
  number.sort();
  for (var i = 3; i >= 0; i--) {
    if (number[i] > 2) continue;
    for (var j = 3; j >= 0; j--) {
      if (j == i || (number[j] > 3 && number[i] == 2)) continue;
      for (var k = 3; k >= 0; k--) {
        if (k == i || k == j || number[k] > 5) continue;
        return '${number[i]}${number[j]}:${number[k]}${number[6 - i - j - k]}';
      }
    }
  }
  return "${[-1]}";
}

String latestClock(int a, int b, int c, int d) {
  final number = [a, b, c, d];
  number.sort();
  number.toString();

  for (var i = 23; i >= 0; i--) {
    for (var j = 59; j >= 0; j--) {
      String hours = (i > 9) ? '$i' : '0$i';
      String minit = (j > 9) ? '$j' : '0$j';

      var clock = [hours[0], hours[1], minit[0], minit[1]];
      clock.sort();
      if (clock.toString() == number.toString()) {
        return '$hours:$minit';
      }
    }
  }

  return "${[-1]}";
}

void main(List<String> args) {
  print(latestClock(2, 9, 1, 4));
}
//https://www.codewars.com/kata/58925dcb71f43f30cd00005f/solutions/dart