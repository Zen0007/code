void ifCaseStatmen() {
  //if case statmen
  List<dynamic> pair = [2, 3];

  if (pair case [int x, int y]) {
    print("kordinat $x,$y");
  } else {
    print("not found");
  }

  var json = {
    "user": ['olifia', 12]
  };
  //var {'user': [name, age]} = json;

  if (json case {'user': [String name, int age]}) {
    print("is name $name , is age $age");
  }
}

void ifStatmen() {
  // if statmen
  String text = "bob";

  if (text == "bob") {
    print("is bob");
  } else {
    print("is not bob");
    print("is if");
  }
}

void switchStatmen() {
  var student = "D";
  switch (student) {
    case 'A':
      print("is very good");
      break;
    case 'B':
      print("is good");
      break;
    case 'C':
      print('off courses');
      break;
    case 'D':
      print("is much bad");
      break;
    default:
      break;
  }
}

void switchExpressions() {
  //switch Expressions
  var value = 'E';
  var isSelf = switch (value) {
    'A' => 100,
    'B' => 90,
    'C' => 80,
    'D' => 70,
    _ => 'trail',
  };
  print(isSelf);
}

void main() {
  switchExpressions();
}
