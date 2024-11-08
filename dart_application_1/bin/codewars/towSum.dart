import 'dart:collection';

import '../dart_application_1.dart';

List<int>? sum(List<int> array, int target) {
  List<int> result = [];
  Map<int, int> map = HashMap<int, int>();

  for (var i = 0; i < array.length; i++) {
    int sum = target - array[i];
    if (map.containsKey(target - array[i])) {
      result.addAll([map[sum]!, i]);
    }
    map.putIfAbsent(array[i], () => i);
  }
  return result;
}

List<int> twoSum(List<int> array, int target) {
  List<int> result = [];
  for (var i = 0; i < array.length; i++) {
    var j = (i + 1) % array.length;
    if (array.contains(target - array[i]) &&
        array.indexOf(target - array[i]) != i) {
      result = [array.indexOf(target - array[i]), i];
    }
    // print("${array[j]}");
  }
  return result;
}

List<int> sum1(List<int> array, int target) {
  List<int> result = [];
  for (var i = 0; i < array.length; i++) {
    for (var j = 1; j <= i; j++) {
      if (array[i] + array[j] == target && i != j) {
        result.addAll([j, i]);
        // break;
      }
    }
  }
  return result;
}

void main(List<String> args) {
  Stopwatch stopwatch = Stopwatch();
  Stopwatch stopwatch2 = Stopwatch();
  Stopwatch stopwatch1 = Stopwatch();
  var list = [3, 3];
  stopwatch.start();
  print('${twoSum(list, 6)} twosum');
  stopwatch.stop();

  stopwatch2.start();
  print('${sum(list, 6)} sum');
  stopwatch2.stop();

  stopwatch1.start();
  print('${sum1(list, 6)} sum1');
  stopwatch1.stop();

  print('${stopwatch1.elapsed.inMilliseconds} sum1');
  print('${stopwatch.elapsed.inMilliseconds} twosum');
  print('${stopwatch2.elapsed.inMilliseconds} sum');
}
