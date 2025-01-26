import 'dart:convert';

class Person {
  String? fistName;
  String? lastName;
  int? age;

  void prints() {
    print("fistname :$fistName");
    print("lastname :$lastName");
    print("age      :$age");
    print(" ");
  }
}

class Constructor {
  String? fistName;
  String? lastName;
  int? age;
  int? salery;

  Constructor(this.fistName, this.lastName, this.age, [this.salery = 100]);

  void show() {
    print("fistname $fistName");
    print("lastname $lastName");
    print("age $age");
    print("salery $salery");
    print(" ");
  }
}

class PersonOne {
  String? fistName;
  String? lastName;
  int? age;

  PersonOne(this.fistName, this.lastName, this.age);

  PersonOne.fromjson(Map<String, dynamic> json) {
    fistName = json['name'];
    lastName = json['last'];
    age = json['age'];
  }

  PersonOne.fromJsonString(String jsonString) {
    Map<String, dynamic> json = jsonDecode(jsonString);
    fistName = json['name'];
    lastName = json['name'];
  }
}

class Inheritance {
  String? name;
  int? age;

  void show() {
    print("name $name");
    print("age $age");
  }
}

class Child extends Inheritance {
  String? yourJob;
  String? nameJob;

  void window() {
    print("it is name job $nameJob");
    print("it is your job $yourJob");
    super.show();
  }
}

class Polimorfise {
  void name() {
    print("is your name");
  }

  String? lastName;
}

class ChildP1 extends Polimorfise {
  String? firstName;
  int? age;
  @override
  void name() {
    print("firstname $firstName , age $age");
  }
}

abstract class Animal {
  String? name;
  void food();
}

class Cat extends Animal {
  @override
  void food() {
    print("name ${this.name}");
  }
}

class Static {
  static int number(int a, int b) {
    return a * b;
  }

  int numBer(int a, int b) {
    return a + b;
  }
}

void main() {
  Person person = Person();
  person
    ..fistName = "asep"
    ..lastName = "gunawan"
    ..age = 9
    ..prints();

  Constructor constructor1 = Constructor("rust", "crab", 18);
  constructor1.show();

  String jsonString1 = '{"name":"asep","last":"cont","age":60}';
  Map<String, dynamic> jsonCodec = jsonDecode(jsonString1);

  PersonOne P1 = PersonOne.fromjson(jsonCodec);
  print("firstname ${P1.fistName} , lastname ${P1.lastName} , age ${P1.age}");

  String jsonString2 = '{"name":"rust","name":"julia"}';

  PersonOne P2 = PersonOne.fromJsonString(jsonString2);
  print("lastname ${P2.lastName}, firstname ${P2.fistName}");

  Child child = Child();
  child
    ..name = "go"
    ..age = 31
    ..nameJob = "hacking"
    ..yourJob = "user"
    ..show()
    ..window();

  Polimorfise Pol1 = ChildP1();
  Pol1..name();

  //Static st = Static();
  print(Static.number(1, 2));
  //print(Static.numBer(8, 8));
}
