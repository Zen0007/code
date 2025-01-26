int arr(List<int> array) => array.reduce((value, element) => value + element);

String? countSheep(numb) {
  var res = '';
  for (var i = 1; i <= numb; i++) {
    res += '$i shape...';
  }
  return res;
}

String? shape(nums) => List.generate(nums, (i) => '${++i} shape...').join();

int goals(int laLigaGoals, int copaDelReyGoals, int championsLeagueGoals) =>
    laLigaGoals + copaDelReyGoals + championsLeagueGoals;

num? sum1(List<num> arr) =>
    arr.length == 1 ? arr[0] : arr.reduce((value, element) => value + element);

List<int>? countBy(int x, int n) => List.generate(n, (i) => (i + 1) * 8);

String? rnaToDna(String dna) => dna.replaceAll("U", "T");

//List<int>? number(List<int> n) =>
//    List.generate(n.length, (index) => n[index] + index);

List<int>? numberT(List<int> n) => (n.map((e) => 0 - e)).toList();

String areaOrPerimeter(List<String> l) => (l.join(" "));

int findSmallestInt(List<int> arr) =>
    (arr.reduce((value, element) => value < element ? value : element));

String smash(words) => ('"$words.join(" ")"');

String isPalindrome(String x) => x.split(' ').join('');

String apple(int a, int b, int c) {
  int mean = (a + b + c) ~/ 3;
  if (mean <= 90) {
    return 'a';
  }
  return '';
}

int nthSmallest(List<int> arr) => int.parse(arr.join(""), radix: 2);

List<int> flattenAndSort(List<List<int>> nums) =>
    nums.expand((element) => element).toList()..sort();

Map<String, int>? hexToRGB(String hex) {
  int color = int.parse(hex.substring(1), radix: 16);
  int red = (color >> 16) & 0xff;
  int blue = (color >> 8) & 0xff;
  int green = (color >> 0) & 0xff;

  Map<String, int> rgb = {"r": red, "b": blue, "g": green};
  return rgb;
}

int? number(List<int> n) {
  Map<int, int> countMap = {};
  for (int num in n) {
    countMap[num] = countMap.containsKey(num) ? countMap[num]! + 1 : 1;
  }

  int sum = countMap.values.reduce((a, b) => a + b);
  return sum;
}

int numbers(List n) => n.fold(0, (a, b) => (b * b) + a);

// int factorial(int n) {
//   int value = 1;
//   for (var i = 1; i <= n; i++) {
//     value *= i;
//   }
//   return value++;
// }

bool bolean(String n) => n.contains('  ') ? false : identical(n, n.trim());

//int greet(String n) => int.tryParse(n) ;

void main() {
  print(countBy(3, 7));
  print(rnaToDna("GACCGCCGCCUUU"));
  print(numberT([1, -2, 3, -4, 5, -9, -80, 90]));
  print(areaOrPerimeter(['hello', 'world', 'this', 'is', 'great']));
  print(smash(['hello', 'world', 'this', 'is', 'great']));

  var s = "helloh";
  // print(s.substring(0, 1));
  print(s[s.length - 1]);
  print(nthSmallest([0, 1, 0, 1]));
  //print(findSmallestInt(([[[1, 3, 5], [100], [2, 4, 6]]])));
  // List<List<int>> list = [
  //   [3, 2, 1],
  //   [4, 6, 5],
  //   [],
  //   [9, 7, 8]
  // ];
  print(hexToRGB("#FF9933"));
  print(flattenAndSort([
    [1, 3, 5],
    [100],
    [2, 4, 6]
  ]));
  //print(greet('1111'));
}
