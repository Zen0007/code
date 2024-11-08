bool checkForFactor(int base, int factor) {
  // your code here

  if (base % factor == 0) {
    return true;
  } else {
    return false;
  }
}

void main() {
  print(checkForFactor(122, 3));
}
