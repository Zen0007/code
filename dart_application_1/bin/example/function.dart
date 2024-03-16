void helloWord() {
  print("hello word");
}

void person(String name, int age) {
  print("it is my name $name is my age $age");
}

void fistPerson(String name, int age, [String? home]) {
  if (home != null) {
    print("it is my name $name is my age $age is color home $home");
  } else {
    print("it is my name $name is my age $age");
  }
}

void anonimFunc() {
  var name = ['A', 'B', 'C', 'D'];
  name.map((i) {
    return i.toLowerCase();
  }).forEach((i) {
    print("$i '  ${i.length}");
  });
}

//lambda fuction
int recursiFunc(int n) => n < 2 ? n : (recursiFunc(n - 1) + recursiFunc(n - 2));

//sycronous Function
void sycronousFunc() {
  print("mulai");
  for (var i = 0; i < 5; i++) {
    print("linterasi $i");
  }
  print("selesai");
}

//asycronous Function
// Future<String> fechDataFromNetwork() {
//   return Future.delayed(Duration(seconds: 2), () {
//     //return 'data from network';
//     throw Error();
//   });
// }

Future<String> asycronous(String data) {
  return Future.delayed(Duration(seconds: 3), () {
    return "hello name $data";
    //return Future.error(Exception("not found"));
  });
}

Future<String> trasformAsycronus() {
  return Future.value("hell0 word");
}

void main() {
  // asycronous("deon")
  //     //.onError((error, stackTrace) => 'call him')
  //     .then((value) => print(value))
  //     .catchError((error) => print("error fuction ${error.toString()}"))
  //     .whenComplete(() => print("upgrate"));
  // print('now');

  // trasformAsycronus()
  //     .then((value) => value.split(" "))
  //     .then((value) => value.reversed)
  //     .then((value) => value.map((e) => e.toUpperCase()))
  //     .then((value) => print(value));
  // print("name");
}
