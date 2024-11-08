// Input: x = 121
// Output: true
// Explanation: 121 reads as 121 from left to right and from right to left.
// Example 2:

// Input: x = -121
// Output: false
// Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
// Example 3:

// Input: x = 10
// Output: false
// Explanation: Reads 01 from right to left. Therefore it is not a palindrome.

// Constraints:

// -231 <= x <= 231 - 1

// Follow up: Could you solve it without converting the integer to a string?



bool isPalindrome(int x) {
  String str = "$x";
  String reverse = '';
  for (var i = str.length; i > 0; i--) {
    reverse += str[i - 1].toString();
  }
  return str == reverse;
}

void main(List<String> args) {
  // Stopwatch stopwatch = Stopwatch();

  // stopwatch.start();
  // print(isPalindrome(1111111111111111));
  // print(isPalindrome(1222222222221));
  // print(isPalindrome(333311113333));
  // stopwatch.stop();
  // print(stopwatch.elapsed.inMilliseconds);
  int integer = 2222211111;
  String str = "$integer";
  String reverse = '';
  for (var i = 0; i < str.length; i++) {
    var res = str.length - 1 - i;
    print(str[res]);
    //reverse += str[i - 1].toString();
    // print(str[i - 1]);
  }
  // print('$reverse $str');
  // print(reverse.runtimeType);
  // print(str.runtimeType);
  // print(reverse == str);
}
