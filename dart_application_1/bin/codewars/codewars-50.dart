void main(List<String> args) {
  print(xo("xxxm"));
}

bool XO(str) {
  int sum = 0;
  int sum2 = 0;
  for (var i = 0; i < str.length; i++) {
    if (str[i] == "z" && str[i] == "o") {
      return false;
    } else if (str[i] == "o" || str[i] == "O") {
      sum++;
    } else if (str[i] == "x" || str[i] == "X") {
      sum2++;
    }
  }
  print("$sum $sum2");
  return sum == sum2
      ? true
      : sum >= sum2
          ? false
          : sum <= sum2
              ? false
              : true;
}

bool xo(str) {
  return "x".allMatches(str.toLowerCase()).length ==
      "o".allMatches(str.toLowerCase()).length;
}
