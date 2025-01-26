import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> postAddContact() async {
  try {
    final url = Uri.parse(
      'https://chat-app-8122b-default-rtdb.asia-southeast1.firebasedatabase.app/main.json',
    );
    final getData = await http.get(url);
    if (getData.statusCode == 200) {
      final Map<String, dynamic> map = jsonDecode(getData.body);
      final String user = 'user';
      final String contact = 'user01';

      for (var element in map.entries) {
        print(element.value[user]);

        final urlAddContact = Uri.parse(
          'https://chat-app-8122b-default-rtdb.asia-southeast1.firebasedatabase.app/main/${element.value[user]}/.json',
        );
        final post = await http.post(
          urlAddContact,
          headers: {"Content-Type": "application/json"},
          body: json.encode(
            {
              contact: {
                "chat": [],
              }
            },
          ),
        );
        print(post.statusCode);
        if (post.statusCode == 201) {
          print("success");
        }
      }
    }
  } catch (e, s) {
    print(e);
    print(s);
  }
}

bool findKeys(Map<String, dynamic> map, String key) {
  for (var element in map.values) {
    if (element == key) {
      return true;
    }
  }
  return false;
}
