/*  Write a function to find the longest common prefix string amongst an array of strings.

 If there is no common prefix, return an empty string ""
 Example 1
 Input: strs = ["flower","flow","flight"]
 Output: "fl"
 Example 2
 Input: strs = ["dog","racecar","car"]
 Output: ""
 Explanation: There is no common prefix among the input strings.
 Constraints
 1 <= strs.length <= 200
 0 <= strs[i].length <= 200
 strs[i] consists of only lowercase English letters.*/

String prefix(List<String> list) {
  String str = list[0];
  for (var i = 1; i < list.length; i++) {
    while (list[i].indexOf(str) != 0) {
      str = str.substring(0, str.length - 1);
      print(str);
      if (str.isEmpty) {
        return '""';
      }
    }
    print("$str //");
  }
  return str;
}

void main(List<String> args) {
  List<String> list = ["flower", "flow", "flight"];
  String zero = list[0];

  print(prefix(list));
}
