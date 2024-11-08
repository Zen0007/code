bool? isLeap1(int year) {
  if (year % 400 == 0) {
    return true;
  } else if (year % 100 == 0) {
    return false;
  } else if (year % 4 == 0) {
    return true;
  } else {
    return false;
  }
}

bool isLeap(int year) {
  return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
}

void main(List<String> args) {
  print(isLeap(2099));
}
