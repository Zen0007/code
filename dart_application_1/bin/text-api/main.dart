import 'dart:math';

void main(List<String> args) => print(generateRandomString(15));

String generateRandomString(int length) {
  const chars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#\$%^&*_+';
  Random rnd = Random();
  return List.generate(length, (index) => chars[rnd.nextInt(chars.length)])
      .join();
}
