int? getCount1(String inputStr) {
  int coun = 0;
  for (var i = 0; i < inputStr.length; i++) {
    if (inputStr[i] == "a" ||
        inputStr[i] == "i" ||
        inputStr[i] == "o" ||
        inputStr[i] == "e" ||
        inputStr[i] == "u") {
      coun++;
    }
  }
  return coun;
}

int? getCount2(String t) => t
    .split("")
    .where((len) =>
        len == "a" || len == "i" || len == "o" || len == "e" || len == "u")
    .length;

int? getCount3(String t) => RegExp('[aiueo]').allMatches(t).length;

int getCount(String inputStr) {
  var count = 0;
  var vowels = <String>["a", "e", "i", "o", "u"];
  for (int i = 0; i < inputStr.length; i++) {
    if (vowels.contains(inputStr[i])) count++;
  }
  return count;
}

void main(List<String> args) {
  print(getCount("abcde"));
}
