void main(List<String> args) {
  print(well(['bad', 'bad', 'bad', 'good', 'good']));
}

String well1(List<String> x) {
  int good = x.where((element) => element == 'good').length;
  if (good >= 3) {
    return "I smell a series!";
  } else if (good >= 1 && good <= 2) {
    return "Publish!";
  }
  return 'Fail!';
}

String well(List<String> x) {
  int coun = 0;
  for (var i in x) {
    if (i == "good") {
      coun++;
    }
  }

  return coun >= 3
      ? "I smell a series!"
      : coun < 1
          ? 'Fail!'
          : "Publish!";
}

String well2(List<String> x) {
  int good = x.where((element) => element == 'good').length;
  return good >= 3
      ? "I smell a series!"
      : good < 1
          ? 'Fail!'
          : "Publish!";
}
