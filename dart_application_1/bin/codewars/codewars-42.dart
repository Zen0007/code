void main(List<String> args) {
  print(decode6("1806479vtvazkzwkgzgscbgvmqpxaejxwaqxn"));
  print('\n');
  print(decode7("1806479vtvazkzwkgzgscbgvmqpxaejxwaqxn"));

  String text = "1806479vtvazkzwkgzgscbgvmqpxaejxwaqxn";
  var reg = RegExp(r'(\d+)([a-z]+)');
  var result = reg.allMatches(text);
  List<String?> show = result.map((e) => e.group(0)).toList();
  print(show);
}

//faild
String decode1(String r) {
  if (!RegExp(r"^\d+[a-z]+$").hasMatch(r)) {
    return "Impossible to decode";
  }

  int len = 1;
  while (len <= r.length ~/ 2) {
    String numstr = r.substring(0, len);
    if (int.tryParse(numstr) != null) {
      int number = int.parse(numstr);
      String decode = "";
      for (var i = len; i < r.length; i++) {
        int charCode = r.codeUnitAt(i) - 'a'.codeUnitAt(0);
        charCode -= (number * (i - len + 1)) % 26;
        if (charCode < 0) {
          charCode += 26;
        }
        decode += String.fromCharCode(charCode + 'a'.codeUnitAt(0));
      }
      if (RegExp(r'^[a-z]+$').hasMatch(decode)) {
        return decode;
      }
    }
    len++;
  }
  return "Impossible to decode";
}

//faild
String decode2(
  String s,
) {
  List<String> results = [];

  for (int num = 0; num <= 25; num++) {
    String decoded = "";
    for (int i = 0; i < s.length; i++) {
      int charCode = s.codeUnitAt(i) - 'a'.codeUnitAt(0);
      charCode -= (num * i) % 26;
      if (charCode < 0) {
        charCode += 26;
      }
      decoded += String.fromCharCode(charCode + 'a'.codeUnitAt(0));
    }
    if (RegExp(r'^[a-z]+$').hasMatch(decoded)) {
      results.add(decoded);
    }
  }

  if (results.isEmpty) {
    return "Impossible to decode";
  } else {
    return results[0];
  }
}

//faild
String decode3(String input) {
  try {
    int num =
        int.parse(input.substring(0, 7)); // Mendapatkan nilai num dari input
    String s = input.substring(7); // Mendapatkan string s dari input
    if (num < 1000000 || num >= 10000000) {
      throw FormatException("invalid number format");
    }

    if (!s.codeUnits.every((element) => element >= 97 && element <= 122)) {
      throw FormatException("Invalid characters in string");
    }
    String result = '';

    for (int i = 0; i < s.length; i++) {
      int x = s.codeUnitAt(i) - 97;
      int newX = (26 + (inverseModulo(num, 26) * x)) % 26;
      result += String.fromCharCode(newX + 97);
    }
    if (RegExp(r'^[a-z]+$').hasMatch(result)) {
      return result;
    } else {
      return "Impossible to decode";
    }
  } catch (e) {
    return "Impossible to decode";
  }
}

int inverseModulo(int a, int m) {
  // Extended Euclidean Algorithm
  int m0 = m;
  int x0 = 0, x1 = 1;
  int y0 = 1, y1 = 0;

  while (a > 1) {
    int q = a ~/ m;
    int t = m;
    m = a % m;
    a = t;

    t = x0;
    x0 = x1 - q * x0;
    x1 = t;

    t = y0;
    y0 = y1 - q * y0;
    y1 = t;
  }

  if (x1 < 0) {
    x1 += m0;
  }
  return x1;
}

String decode4(String r) {
  String res = "";
  int num = int.parse(r.replaceAll(RegExp(r'[^0-9+]'), ''));
  if (num % 2 == 0 || num % 13 == 0) return "Impossible to decode";
  r = r.replaceAll(RegExp(r'[0-9+]'), '');

  for (int i = 0; i < r.length; i++) {
    for (int j = 0; j <= 25; j++) {
      if ((j * num) % 26 == r.codeUnitAt(i) - 'a'.codeUnitAt(0)) {
        res += String.fromCharCode(j + 'a'.codeUnitAt(0));
        break;
      }
    }
  }
  return res;
}

String decode5(String r) {
  Map map1 = {};
  Map map2 = {};
  String str = "abcdefghijklmnopqrstuvwxyz";
  Map modNums = {};
  int number = 0;
  String strIncode = "";
  String result = "";

  for (int i = 0; i < r.length; i++) {
    try {
      number = 10 * number + int.parse(r[i]);
    } catch (e) {
      strIncode += r[i];
    }
  }
  number = number % 26;
  for (var i = 0; i < 26; i++) {
    map1[str[i]] = i;
    map2[i] = str[i];
    modNums[(i * number) % 26] = i;
  }
  if (modNums.length != 26) {
    return "Impossible to decode ";
  }
  for (var i = 0; i < strIncode.length; i++) {
    result += map2[modNums[map1[strIncode[i]]]];
  }
  return result;
}

String decode6(String r) {
  final reg = RegExp(r'[a-z]');
  var res = int.parse(r.substring(0, r.indexOf(reg)));
  var temp = r.substring(r.indexOf(reg));
  List<int> out = [];
  for (var element in temp.split('')) {
    for (var i = 0; i < 26; i++) {
      if ((res * i) % 26 == (element.codeUnitAt(0) - 97)) {
        out.add(i);
      }
    }
  }
  if (out.isEmpty || out.length != temp.length) {
    return "Impossible to decode ";
  }
  List<String> output = [];
  for (var i in out) {
    output.add(String.fromCharCode(i + 97));
  }
  return output.join('');
}

String? decode7(String r) {
  var a = "abcdefghijklmnopqrstuvwxyz";
  RegExp exp = RegExp(r"(\d+)([a-z]+)");
  Iterable<Match> matches = exp.allMatches(r);
  final matchNum = matches.elementAt(0).group(1)!;
  final matchedText = matches.elementAt(0).group(2)!;
  var dict = {
    3: 9,
    9: 3,
    21: 5,
    5: 21,
    7: 15,
    15: 7,
    11: 19,
    19: 11,
    17: 23,
    23: 17,
    25: 25,
    1: 1
  };
  int? n = dict[int.parse(matchNum) % 26];
  if (n == null) {
    return "Impossible to decode";
  }
  var res = "";
  for (var i = 0; i < matchedText.length; i++) {
    var c = matchedText[i];
    res += a[(a.indexOf(c) * n) % 26];
  }
  return res;
}
