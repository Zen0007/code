// Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

// Symbol       Value
// I             1
// V             5
// X             10
// L             50
// C             100
// D             500
// M             1000
// For example, 2 is written as II in Roman numeral, just two ones added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.

// Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

// I can be placed before V (5) and X (10) to make 4 and 9.
// X can be placed before L (50) and C (100) to make 40 and 90.
// C can be placed before D (500) and M (1000) to make 400 and 900.
// Given a roman numeral, convert it to an integer.

// Example 1:

// Input: s = "III"
// Output: 3
// Explanation: III = 3.
// Example 2:

// Input: s = "LVIII"p
// Output: 58
// Explanation: L = 50, V= 5, III = 3.
// Example 3:

// Input: s = "MCMXCIV"
// Output: 1994
// Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.

import 'dart:collection';

int? strToint(String str) {
  Map<String, int> map = {
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1000
  };
  int result = 0;
  int i = 0;
  //while still 3 dan if start index
  while (i < str.length) {
    if (i < str.length - 1 && map[str[i]]! < map[str[i + 1]]!) {
      result += map[str[i + 1]]! - map[str[i]]!;
      i += 2;
    } else {
      result += map[str[i]]!;
      i += 1;
    }
  }
  //print(str[str.length - 1]);
  return result;
}

int? romanInt(String roman) {
  Map<String, int> map = HashMap<String, int>();
  map.putIfAbsent("I", () => 1);
  map.putIfAbsent("V", () => 5);
  map.putIfAbsent("X", () => 10);
  map.putIfAbsent("L", () => 50);
  map.putIfAbsent("C", () => 100);
  map.putIfAbsent("D", () => 500);
  map.putIfAbsent("M", () => 1000);
  int result = map[roman[roman.length - 1]]!;

  for (var i = roman.length - 2; i >= 0; i--) {
    if (map[roman[i]]! < map[roman[i + 1]]!) {
      result -= map[roman[i]]!;
    } else {
      result += map[roman[i]]!;
    }
  }
  return result;
}

void main(List<String> args) {
  // String roman = "MCMXCIV";
  // var sum = 0;
  // var reverse = '';
  Map<String, int> map = HashMap<String, int>();
  map.putIfAbsent("I", () => 1);
  map.putIfAbsent("V", () => 5);
  map.putIfAbsent("X", () => 10);
  map.putIfAbsent("L", () => 50);
  map.putIfAbsent("C", () => 100);
  map.putIfAbsent("D", () => 500);
  map.putIfAbsent("M", () => 1000);
  // int result = map[roman[roman.length - 1]]!;
  // len == 3 index start 0 3 is not in index len -1 = 2 last index

  try {
    // for (var i = roman.length - 2; i >= 0; i--) {
    //   // print(roman[i + 1]);
    //   // print("///n");
    //   print(roman[i]);
    //   // print("\n");
    //   reverse += roman[i + 1];
    //   //reverse1 = reverse[i];
    //   print(map[roman[i]]!);
    // }
    print(strToint("IV"));

    //print(romanInt("LVIII"));
  } catch (e, stackTrace) {
    print(stackTrace);
    print(e);
  }
}
