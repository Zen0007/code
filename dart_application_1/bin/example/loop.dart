void forLoop() {
  var num = 21;
  for (var i = 1; i < num; i++) {
    print("very sorry $i");
  }
}

void forIn() {
  var num = ["apple", "orange", "pier", "lemon"];

  for (var i in num) {
    print("name fruit $i");
  }
}

void forEach() {
  // List<String> list = ["a", "b", "c", "d"]; not standar
  // list.forEach((list) {
  //   print(list);
  // });

  Map<String, int> daftar = {"gus": 40, "rust": 90, "deno": 77, "R": 71};
  daftar.forEach((key, value) {
    print("name $key age $value");
  });
}

void whileLoop() {
  int num = 50;
  while (num <= 100) {
    if (num % 2 == 0) {
      print(num);
    }
    num++;
  }
}

void doWhileLoop() {
  var num = 1;

  do {
    print(num);
    num++;
  } while (num < 11);
}

void main() {
  doWhileLoop();
}
