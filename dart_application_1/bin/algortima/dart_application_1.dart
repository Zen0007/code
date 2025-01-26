import 'dart:collection';
import 'dart:math' as math;

void main(List<String> args) {
  List<int> array = [3, 3];
  int target = 6;
  List<int> result = [];
  Map<int, int> map = HashMap();

  try {
    for (var i = 0; i < array.length; i++) {
      int nums = array[i];
      int sum = target - nums;
      print(
          " $nums   ||    ${map[target - array[i]]}        ||    ${map.containsKey(sum)}       ||    $i");
      if (map.containsKey(sum)) {
        result.addAll([map[sum]!, i]);
      }
      map.putIfAbsent(nums, () => i);
    }

    map.forEach((key, value) {
      print("key $key value $value");
    });

    print(sum(array, target));
  } catch (e, stackTrace) {
    print(e);
    print(stackTrace);
  }
}

List<int> twoSum(List<int> array, int target) {
  List<int> result = [];
  for (var i = 0; i < array.length; i++) {
    var j = (i + 1) % array.length;
    if (array.contains(target - array[i]) &&
        array.indexOf(target - array[i]) != i) {
      result = [array.indexOf(target - array[i]), i];
    }
    print("${array[j]}");
  }
  return result;
}

List<int> sum(List<int> array, int target) {
  List<int> result = [];
  Map<int, int> map = HashMap();
  for (var i = 0; i < array.length; i++) {
    //
    int sum = target - array[i];
    if (map.containsKey(sum)) {
      result.addAll([map[sum]!, i]);
    }
    map.putIfAbsent(array[i], () => i);
  }
  return result;
}

List<int> reverse(int n) {
  List<int> result = [];
  int temp = n;
  int i = 1;
  while (temp != 0) {
    result.add(temp ~/ math.pow(10, i).toInt() % math.pow(10, i).toInt());
    temp ~/= 10;
    i++;
  }
  return result;
}
