int nextHigher1(int n) {
  int countOes = countSet(n);
  int nextNumber = n + 1;
  while (countSet(nextNumber) != countOes) {
    nextNumber++;
  }
  return nextNumber;
}

int countSet(int number) {
  int count = 0;
  while (number > 0) {
    if ((number & 1) == 1) {
      count++;
    }
    number >>= 1;
    //print('$number //');
  }
  //print('$count 00');i
  return count;
}

int nextHigher2(int n) {
  int num(int j) => j.toRadixString(2).split('').where((a) => a == '1').length;
  var start = num(n);
  var maxBits = (n + 1).toRadixString(2).length;
  for (var i = n + 1; i < (1 << maxBits); i++) {
    if (start == num(i)) {
      return i;
    }
  }
  return -1;
}

int nextHigher(int n) {
  int result = n;
  int countOunt = n.toRadixString(2).replaceAll('0', '').length;

  while (countOunt != result.toRadixString(2).replaceAll('0', '').length ||
      result <= n) {
    result++;
  }
  return result;
}

void main(List<String> args) {
  print(nextHigher(129999999));
  //print(129.toRadixString(2).split('').where((e) => e == '1').length);
}
