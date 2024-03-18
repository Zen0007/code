bool negationValue(String str, bool val) {
  // your code here
  return str.length % 2 == 0 ? val : !val;
}

void main(List<String> args) {
  var str = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"; //false
  var str1 = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"; //true
  print(negationValue(str1, true));
}
