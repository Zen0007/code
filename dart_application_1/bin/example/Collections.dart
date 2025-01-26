import 'dart:io';

void listNumber() {
  var myList = [0, 'one', 'two', 'three', 'four', 'five'];
// use forEach()
  myList.forEach((item) => print("1 use foreach: $item"));
// or
// myList.forEach(print);
// use iterator
  var listIterator = myList.iterator;
  while (listIterator.moveNext()) {
    print("2 use iterator: ${listIterator.current}");
  }
// use every()
  myList.every((item) {
    print("3 use every: $item");
    return true;
  });
// simple for-each
  for (var item in myList) {
    print("4 use forEach simple: $item");
  }
// for loop with item index
  for (var i = 0; i < myList.length; i++) {
    print("5 for loop whit item index: ${myList[i]}");
  }

  myList.replaceRange(1, 3, [5]);
  print(myList);

  var intList = [5, 8, 17, 11];
  if (intList.any((n) => n > 10)) {
    print('At least one number > 10 $intList');
  }
  var listOfNumbers = [
    [1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ];
  listOfNumbers.forEach((nums) => nums.forEach((number) => print(number)));
  listOfNumbers.every((nums) {
    nums.forEach((number) => print("1 satu $number"));
    return true;
  });
  for (var nums in listOfNumbers) {
    for (var number in nums) {
      print("2 dua $number");
    }
  }
  for (var i = 0; i < listOfNumbers.length; i++) {
    for (var j = 0; j < listOfNumbers[i].length; j++) {
      print("3 tiga ${listOfNumbers[i][j]}");
    }
  }
}

void setAbsolut() {
  var setB = {"color", "red", "purle", 'green'};
  setB.add("orange");
  print(setB);
}

void mapObjeck() {
  var mapC = Map<String, int>();
  mapC["asep"] = 91;
  mapC["puncak"] = 01;
  mapC["anjas"] = 81;
  mapC["rust"] = 41;
  print(mapC.length);
}

void listIO() {
  List<Map<String, dynamic>> person = [];
  while (true) {
    stdout.write("masukan nama (atau selesai)");
    String nama = stdin.readLineSync()!.trim();

    int umur = int.parse(stdin.readLineSync()!);

    person.add({"name": nama, 'age': umur});
    if (nama.toLowerCase() == 'y') break;
  }
  print("\ndata masuk :");
  for (var p in person) {
    print("name ${p['name']} , umur ${p['umur']}");
  }
  print('r');
}

void main() {
  print("pending");
}
