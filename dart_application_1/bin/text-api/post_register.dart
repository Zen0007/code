import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> postData() async {
  try {
    final url = Uri.parse('http://0.0.0.0:8080/register');

    final respones = http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode(
        {
          "name": "ada lovlace",
          "email": "lovlace@gmail.com",
          "password": "ada 000 "
        },
      ),
    );

    respones.then(
      (value) => print(value.statusCode),
    );
    print("success");
  } catch (e, s) {
    print(e);
    print(s);
  }
}
