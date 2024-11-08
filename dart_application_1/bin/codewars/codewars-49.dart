import 'dart:math';

void main(List<String> args) {
  try {
    //print(cats(547, 937));
    //print(monkeyCount(100));
    print(squareSum([0, 10, 18, 17]));
  } catch (exception, stackTrace) {
    print(exception.toString());
    print(stackTrace.toString());
  }
}

int squareSum(List<int> numbers) {
  int result = 0;
  for (int i = 0; i < numbers.length; i++) {
    result = result + numbers[i] * numbers[i];
  }
  return result.toInt();
}

List<int> monkeyCount(int n) => List.generate(n, (index) => index + 1);

int cats(start, finish) {
  List<int> dp = List<int>.filled(finish + 1, 0);
  dp[start] = 0;

  for (int i = start; i <= finish; i++) {
    if (i + 1 <= finish) {
      dp[i + 1] = dp[i + 1] == 0 ? dp[i] + 1 : dp[i + 1];
    }
    if (i + 3 <= finish) {
      dp[i + 3] = dp[i + 3] == 0 ? dp[i] + 1 : dp[i + 3];
    }
  }

  return dp[finish];
}
