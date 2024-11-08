String? chromosomeCheck1(String sperm) {
  if (sperm == 'XX') {
    return "Congratulations! You're going to have a daughter.";
  } else if (sperm == "XY") {
    return "Congratulations! You're going to have a son.";
  }
}

String? chromosomeCheck(String n) => n == 'XX'
    ? "Congratulations! You're going to have a daughter."
    : "Congratulations! You're going to have a son.";
void main(List<String> args) {
  print(chromosomeCheck1('XY'));
}
