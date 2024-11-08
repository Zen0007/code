List<int> lastEvenNumbers(List<int> numbers, int length) {
  // Membuat list baru untuk menyimpan bilangan genap
  List<int> evenNumbers = [];

  // Iterasi melalui array asli dan menambahkan bilangan genap ke list baru
  for (int number in numbers) {
    if (number.isEven) {
      evenNumbers.add(number);
    }
  }

  // Mengambil 'length' bilangan genap terakhir dari list
  return evenNumbers.length >= length
      ? evenNumbers.sublist(evenNumbers.length - length)
      : [];
}

List<int> lastEvenNumbers11(List<int> numbers, int number) {
  List<int> evenNumbers = numbers.where((numA) => numA.isEven).toList();
  return evenNumbers.sublist(evenNumbers.length - number);
}

List<int> evenNumbers(List<int> number, int n) {
  List<int> result = [];
  for (var i = 0; i < number.length; i++) {
    if (number[i].isEven) {
      result.add(number[i]);
    }
  }
  return result.sublist(result.length - n);
}

void main() {
  List<int> number1 = [-22, 5, 3, 11, 26, -6, -7, -8, -9, -8, 26];
  int target1 = 2;
  print(number1.where((numA) => numA.isEven).toList().sublist(6 - target1));
  //sublist(number1 = 6 n = 2 = 6-2 =4 )[-22, 26, -6, -8,| -8, 26]

  List<int> result1 = evenNumbers(number1, target1);
  print(result1); // Output: [-8, 26]

  List<int> number2 = [
    -69,
    28,
    14,
    93,
    2,
    69,
    -95,
    10,
    83,
    -60,
    -12,
    87,
    -56,
    23,
    70,
    100,
    30,
    18,
    -22,
    67,
    39,
    -10,
    83,
    -71,
    95,
    52,
    -5,
    81,
    84,
    -20,
    -88,
    45,
    -93,
    72,
    -17,
    -60
  ]; //70, 100, 30, 18, -22, -10, 52, 84, -20, -88, 72, -60
  int target2 = 12;

  List<int> result2 = lastEvenNumbers11(number2, target2);
  print(result2); // Output: [8, 6, 4]
}
