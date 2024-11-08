int? searchBinary(List<int> number, int target) {
  int ringt = number.last;
  int left = 0;

  while (left <= ringt) {
    int mid = (ringt + left) ~/ 2;
    int result = mid.toInt();

    if (target == number[mid]) {
      return mid;
    } else if (target <= number[mid]) {
      ringt = mid - 1;
    } else {
      left = mid + 1;
    }
    return result;
  }
}

void main() {
  List<int> number = [1, 5, 3, 8, 3, 7, 4, 9, 3];
  int target = 4;

  int? index = searchBinary(number, target);

  print(index);
}
