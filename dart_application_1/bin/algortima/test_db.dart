import 'dart:convert';
import 'dart:io';

import 'package:web_socket_channel/io.dart';

void addNewCollection(String nameCollection) {
  category['category'][nameCollection] = {};
}

void insertToCollection(String nameCategory, String name, String label) {
  try {
    if (!category['category'].containsKey(nameCategory)) {
      print("the category is not exists ");
      return;
    }

    final List lastIndex = category['category']['accesPoint']
        .keys
        .map((key) => int.parse(key))
        .toList();
    // Menghitung key terakhir jika sudah ada data
    int lastKey =
        lastIndex.isEmpty ? 0 : lastIndex.reduce((a, b) => a > b ? a : b);

    // Menentukan key baru yang increment
    String newKey = "${lastKey + 1}";

    // Menambahkan item baru dengan key increment
    category['category'][nameCategory]![newKey] = {
      'name': name,
      'Label': label,
      'image': "-",
    };
  } catch (e, s) {
    print(e);
    print(s);
  }
}

void borrowingItem(String index, String collection, String name,
    String classStuden, String nisn, String nameTeacher) {
  try {
    if (!category['category'][collection].containsKey(index)) {
      print("the name index not found in colection $collection");
      return;
    }
    final borrowItem = category['category'][collection][index];

    // category['borrowing'] ??= {};
    category['borrowing'][name] ??= {
      "userName": name,
      "class": classStuden,
      "nameTeacher": nameTeacher,
      "nisn": nisn,
      "item": {}
    };

    // Add the item to the user's borrowing collection without replacing existing items
    category['borrowing'][name]['item'][collection] ??= {};
    category['borrowing'][name]['item'][collection][index] = borrowItem;
    category['category'][collection].remove(index);
  } catch (e, s) {
    print(e);
    print(s);
  }
}

void senBack(String nameUser, String index, String collection) {
  try {
    final dataBack = category['borrowing'][nameUser]['item'][collection][index];

    // Add the item back to accesPoint with the same key
    category['category']['accesPoint'][index] = dataBack;
  } catch (e, s) {
    print(e);
    print(s);
  }
}

final Map<String, dynamic> category = {
  'category': {
    "accesPoint": {
      "1": {
        "label": "no 334",
        "nameItem": "tp Link",
        "image": "-",
        "status": "borrow"
      },
      "2": {
        "label": "no 334",
        "nameItem": "tp Link",
        "image": "-",
        "": "",
        "status": "borrow"
      }
    },
    "mikrotick": {
      "1": {
        "label": "44043",
        "nameItem": "mikrotick f00d",
        "image": "-",
        "status": "borrow"
      }
    },
  },
  'borrowing': {}
};

class Item {
  final String category;
  final String index;
  final String nameItem;
  final String label;

  Item({
    required this.category,
    required this.index,
    required this.nameItem,
    required this.label,
  });

  factory Item.from(
          String category, String index, String nameItem, String label) =>
      Item(
        category: category,
        index: index,
        nameItem: nameItem,
        label: label,
      );
}

class BorrowUser {
  final String? nameUser;
  final String? classUser;
  final String? nameTeacher;
  final String? nisn;
  final String? imageUser;
  final String? imageNisn;
  final String? status;
  final List<Item> item;

  BorrowUser({
    this.nameUser,
    this.classUser,
    this.nameTeacher,
    this.nisn,
    this.imageUser,
    this.imageNisn,
    this.status,
    required this.item,
  });

  factory BorrowUser.from(Map<String, dynamic> json) {
    final List<Item> item = [];
    for (var data in json['items']) {
      final index = Item.from(
        data["category"],
        data['id'],
        data['nameItem'],
        data['label'],
      );
      item.add(index);
    }

    return BorrowUser(
      nameUser: json['name'],
      classUser: json['class'],
      nameTeacher: json['nameTeacher'],
      nisn: json['nisn'],
      imageUser: json['imageSelfie'],
      imageNisn: json['imageStudenCard'],
      status: json['status'],
      item: item,
    );
  }
}

// Simulated JSON data (as a string)
String jsonString = '''
[
    {
        "asta": {
            "status": "borrow",
            "name": "asta",
            "class": "xi",
            "nameTeacher": "yami",
            "nisn": "12345678",
            "imageSelfie": "-",
            "imageStudentCard": "-",
            "items": [
                {
                    "category": "accessPoint",
                    "id": "1",
                    "label": "no 123",
                    "nameItem": "tp Link",
                    "image": "-",
                    "status": "available"
                },
                {
                    "category": "accessPoint",
                    "id": "2",
                    "label": "no 123",
                    "nameItem": "tp Link",
                    "image": "-",
                    "status": "available"
                },
                {
                    "category": "mikrotick",
                    "id": "1",
                    "label": "no 2",
                    "nameItem": "cisco",
                    "image": "-",
                    "status": "available"
                }
            ]
        }
    },
    {
        "yuno": {
            "status": "borrow",
            "name": "yuno",
            "class": "xi",
            "nameTeacher": "yami",
            "nisn": "12345678",
            "imageSelfie": "-",
            "imageStudentCard": "-",
            "items": [
                {
                    "category": "accessPoint",
                    "id": "1",
                    "label": "no 123",
                    "nameItem": "tp Link",
                    "image": "-",
                    "status": "available"
                },
                {
                    "category": "accessPoint",
                    "id": "2",
                    "label": "no 123",
                    "nameItem": "tp Link",
                    "image": "-",
                    "status": "available"
                },
                {
                    "category": "mikrotick",
                    "id": "1",
                    "label": "no 2",
                    "nameItem": "cisco",
                    "image": "-",
                    "status": "available"
                }
            ]
        }
    }
]
''';

void main() async {
  try {
    // Decode JSON data
    final file = await File(
      "C:/Users/muham/OneDrive/Dokumen/Html_1/peraktekj.js/dart-sdk/dart_application_1/bin/data_dummy/test_shcema.json",
    ).readAsString();
    final ws = IOWebSocketChannel.connect('');
    final List jsonDecode = json.decode(file);

    // Use a set to keep track of unique items

    List<BorrowUser> dataUser = [];
    for (var i = 0; i < jsonDecode.length; i++) {
      for (var data in jsonDecode[i].values) {
        final user = BorrowUser.from(data);
        dataUser.add(user);
      }
    }

    for (var user in dataUser) {
      print('User: ${user.nameUser}');
      print('  Class: ${user.classUser}');
      print('  Teacher: ${user.nameTeacher}');
      print('  NISN: ${user.nisn}');
      print('  Selfie: ${user.imageUser}');
      print('  Student Card: ${user.imageNisn}');
      print('  Status: ${user.status}');
      for (var data in user.item) {
        print(data.category);
        print(data.index);
        print(data.label);
        print(data.nameItem);
      }
    }
  } catch (e, s) {
    print(e);
    print(s);
  }
}

void main1(List<String> args) {
  try {
    // insertToCollection('accesPoint', "tp link", "no 144");
    // insertToCollection('accesPoint', "toto link", "no 142");
    // insertToCollection('mikrotick', "cisco", "no 2");
    // insertToCollection('mikrotick', "cisco", "no 2");
    // borrowingItem("2", "accesPoint", "asta", "XII VIE", "123456", "lili");
    // borrowingItem("1", "accesPoint", "asta", "XII VIE", "123456", "lili");
    // borrowingItem("1", "mikrotick", "asta", "XII VIE", "123456", "lili");
    // borrowingItem("1", "mikrotick", "asta", "XII VIE", "123456", "lili");
    // insertToCollection('accesPoint', "toto link", "no 132");
    // senBack("yuno", "2", "accesPoint");
    // insertToCollection('accesPoint', "tp link", "no 144");
    // insertToCollection('accesPoint', "tp link", "no 144");
    // addNewCollection("monitor");

    // final List keys = category['category']['accesPoint']
    //     .keys
    //     .map((key) => int.parse(key))
    //     .toList();
    // final key = category['category'].keys;
    final Map<String, dynamic> db = {
      "auth": {
        "asta": {
          "name": "asta",
          "password": "asta1234",
        },
        "yuno": {
          "name": "yuno",
          "password": "yuno1234^",
        }
      },
      'category': {
        "mikrotick": {
          "1": {
            "nameItem": "cisco",
            "label": "no 2",
            "image": "-",
            "status": "borrow"
          }
        },
        "accesPoint": {
          "1": {
            "label": "no 123",
            "nameItem": "tp Link",
            "image": "-",
            "status": "borrow"
          },
          "2": {
            "label": "no 334",
            "nameItem": "tp Link",
            "image": "-",
            "status": "borrow"
          }
        }
      },
      "borrowing": {
        "asta": {
          "status": "borrow",
          "name": "asta",
          "class": "xi",
          "nameTeacher": "yami",
          "nisn": "12345678",
          "imageSelfie": "-",
          "imageStudenCard": "-",
          "item": {
            "accesPoint": {
              "1": {
                "label": "no 123",
                "nameItem": "tp Link",
                "image": "-",
                "status": "availeble"
              },
              "2": {
                "label": "no 123",
                "nameItem": "tp Link",
                "image": "-",
                "status": "availeble"
              }
            },
            "mikrotick": {
              "1": {
                "name": "cisco",
                "label": "no 2",
                "image": "-",
                "status": "availeble"
              }
            }
          }
        },
      },
      "pending": {},
      "itemBack": {},
    };

    final category = {
      "accesPoint": {
        "1": {
          "status": "availble",
          "label": "no 334",
          "nameItem": "tp Link",
          "image": "-"
        },
        "2": {
          "label": "no 334",
          "nameItem": "tp Link",
          "image": "-",
          "status": "availble",
        },
      },
      "mikrotick": {
        "1": {
          "nameItem": "cisco",
          "label": "no 2",
          "image": "-",
          "status": "borrow"
        }
      }
    };

    // Map<String, dynamic> updatedData = Map.from(data); // Clone map utama
    // updatedData["asta"]["status"] = "return"; // Ubah status utama
    for (var element in category.entries) {
      final key = element.value.keys;

      print(key);
      print(category[element.key]!['$key']);
    }
    int count = 0;
    category['accesPoint']!.forEach((keycoll, value) {
      // value.forEach((itemKey, itemValue) {
      //   print(keycoll);
      //   print(db['category']['accesPoint'][keycoll]['status']);
      // });
      print(keycoll);
      print(value);
      if (category['accesPoint']![keycoll]!['status'] == "borrow") {
        count++;
      }
    });

    // db['category'].forEach((categoryKey, categoryItems) {
    //   categoryItems.forEach((itemKey, itemValue) {
    //     // Cek apakah item ada di borrowingItems
    //     if (borrowingItems.containsKey(categoryKey) &&
    //         borrowingItems[categoryKey].containsKey(itemKey)) {
    //       // Jika ada, ubah status menjadi "availeble"
    //       print(itemKey);
    //       print(itemValue);
    //       itemValue['status'] = 'availeble';
    //     }
    //   });
    // });

    db['borrowing']['yuno'] = {"name": "yuno", "nis": "12344", "img": "-"};

    // for (var data in db['category'].entries) {
    //   // print("${db['category'].keys.elementAt(data.value)} ");
    //   data['accesPoint'].forEach((itemKey, itemValue) {
    //     print(itemKey);
    //   });
    // }
    // var data = <int>[];
    // data.add(1);
    // data.add(2);
    print(count);
  } catch (e, s) {
    print(e);
    print(s);
  }
}
