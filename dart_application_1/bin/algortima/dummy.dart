import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:mirrors';

class CategoryList {
  final String key;
  final String id;
  CategoryList({
    required this.key,
    required this.id,
  });

  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
        key: json.keys.firstWhere(
          (key) => key != "_id",
        ),
        id: json['_id']['\$oid'],
      );
}

class Id {
  Id({
    required this.oid,
  });
  String oid;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        oid: json["/u0024oid"],
      );
  Map<String, dynamic> toJson() => {
        "\u0024oid": oid,
      };
}

class Index {
  Index({
    required this.name,
    required this.status,
    required this.label,
    required this.image,
    required this.category,
    required this.index,
  });
  String status;
  String label;
  String name;
  String image;
  String index;
  String category;

  factory Index.fromJson(
          Map<String, dynamic> json, String index, String category) =>
      Index(
        name: json['nameItem'],
        status: json['status'],
        label: json['label'],
        image: json['image'],
        index: index,
        category: category,
      );
  Map<String, dynamic> toJson() => {
        "status": status,
        "nameItem": name,
        "label": label,
        "image": image,
      };
}

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

Stream<List<Index>> returnListIndex(String title) async* {
  final file = await File(
          "C:/Users/muham/OneDrive/Dokumen/Html_1/peraktekj.js/dart-sdk/dart_application_1/bin/data_dummy/inventory.category.json")
      .readAsString();
  final decode = jsonDecode(file);

  final List<Index> list = [];
  for (var data in decode) {
    if (data[title] != null) {
      data[title].forEach((keycoll, value) {
        final index = Index.fromJson(value, keycoll, title);
        list.add(index);
      });
    } else {
      yield [];
    }
  }
  yield list;
}

Future<List<Map>> returnListCategory() async {
  final file = await File(
    "C:/Users/muham/OneDrive/Dokumen/Html_1/peraktekj.js/dart-sdk/dart_application_1/bin/data_dummy/inventory.category.json",
  ).readAsString();
  try {
    final decode = jsonDecode(file);

    final List<Map> list = [];

    for (var data in decode) {
      // final category = CategoryList.fromJson(data);
      // list.add(category);
      list.add({
        "key": data.keys.firstWhere(
          (key) => key != "_id",
        ),
        "id": data['_id']['\$oid'],
      });
    }

    return list;
  } catch (e, s) {
    print("$e           -----------------------");
    print("$s                   ||||||||||||||||||||||||");

    return [];
  }
}

Stream<List<BorrowUser>> borrowUser() async* {
  final file = await File(
    "C:/Users/muham/OneDrive/Dokumen/Html_1/peraktekj.js/dart-sdk/dart_application_1/bin/data_dummy/dbBorrow.json",
  ).readAsString();

  final List jsonDecode = json.decode(file);
  final Set<String> uniqueList = {};
  List<BorrowUser> listBorrow = [];

  for (var i = 0; i < jsonDecode.length; i++) {
    jsonDecode[i].forEach((_, value) {
      value['item'].forEach((category, itemsData) {
        itemsData.forEach((index, itemData) {
          String uniqueIdentifier = "${value['name']}${category}${index}";
          if (!uniqueList.contains(uniqueIdentifier)) {
            uniqueList.add(uniqueIdentifier);
          }
        });
      });
    });
    yield listBorrow;
  }
}

Stream<Map> simulationServer() async* {
  final file = await File(
          "C:/Users/muham/OneDrive/Dokumen/Html_1/peraktekj.js/dart-sdk/dart_application_1/bin/data_dummy/inventory.category.json")
      .readAsString();
  final decode = jsonDecode(file);
  for (var data in decode) {
    yield data;
  }
}

Stream catchResponse() async* {
  final List dataList = [];
  final StreamController<List> catchInListener = StreamController<List>();
  final stream = simulationServer();
  stream.listen(
    (event) {
      for (var data in event.entries) {
        if (data.key != "_id") {
          dataList.add(data.value);
        }
      }
    },
  );
}

void main(List<String> args) async {
  int start1 = DateTime.now().millisecond;

  final stream = catchResponse();
  stream.listen(
    (event) {
      print(event);
    },
  );

  int end1 = DateTime.now().millisecond;
  int result1 = start1 - end1;
  print(('${result1 * -1} #2'));
}

void main9(List<String> args) async {
  int start1 = DateTime.now().millisecond;
  try {
    final file = await File(
            "C:/Users/muham/OneDrive/Dokumen/Html_1/peraktekj.js/dart-sdk/dart_application_1/bin/data_dummy/inventory.category.json")
        .readAsString();
    final decode = jsonDecode(file);

    final List<Index> list = [];
    for (var i = 0; i < decode.length; i++) {
      decode[i].forEach((key, value) {
        if (key != '_id') {
          value.forEach((key1, value1) {
            final index = Index.fromJson(value1, key1, key);
            list.add(index);
            // print(value1['label']);
          });
        }
      });
    }

    for (var data in list) {
      print(data.category);
      print(data.index);
      print(data.name);
      print(data.label);
      print(data.image);
    }

    int end1 = DateTime.now().millisecond;
    int result1 = start1 - end1;
    print(('${result1 * -1} #2'));
  } catch (e, s) {
    print(e);
    print(s);
  }
}

void main3(List<String> args) async {
  int start1 = DateTime.now().millisecond;
  try {
    final file = await File(
      "C:/Users/muham/OneDrive/Dokumen/Html_1/peraktekj.js/dart-sdk/dart_application_1/bin/data_dummy/inventory.category.json",
    ).readAsString();
    final decode = jsonDecode(file);

    // Filter the data using a for loop
    List<Map<String, dynamic>> filteredData = [];

    for (var item in decode) {
      Map<String, dynamic> filteredItem = {};

      item.forEach((key, value) {
        if (key == '_id') {
          filteredItem[key] = value;
        } else if (value is Map) {
          Map<String, dynamic> filteredSubItem = {};
          value.forEach((subKey, subValue) {
            if (subValue['status'] == 'available') {
              filteredSubItem[subKey] = subValue;
            }
          });
          if (filteredSubItem.isNotEmpty) {
            filteredItem[key] = filteredSubItem;
          }
        }
      });

      if (filteredItem.length > 1) {
        filteredData.add(filteredItem);
      }
    }
    print(filteredData);
  } catch (e, s) {
    print(e);
    print(s);
  }

  int end1 = DateTime.now().millisecond;
  int result1 = start1 - end1;
  print(('${result1 * -1} #2'));
}

void main1(List<String> args) async {
  try {
    int start1 = DateTime.now().millisecondsSinceEpoch;
    final file = await File(
      "C:/Users/muham/OneDrive/Dokumen/Html_1/peraktekj.js/dart-sdk/dart_application_1/bin/data_dummy/dbBorrow.json",
    ).readAsString();

    final List jsonDecode = json.decode(file);
    for (var data in jsonDecode) {
      data.forEach((key, value) {
        print(key);
        print(value['status']);
      });
    }
    int count = 0;
    for (var i = 0; i < jsonDecode.length; i++) {
      jsonDecode[i].forEach((_, value) {
        value['item'].forEach((key, value1) {
          value1.forEach((key2, value2) {
            // print(value1);
            // print(value2['nameItem']);
          });
        });
      });
    }

    final keyItem = await returnListCategory();
    print(keyItem.first['key']);
    print(keyItem.last['id']);
    while (count < 1000) {
      for (var data in jsonDecode) {
        data.forEach((_, value) {
          value['item'].forEach((_, value1) {
            value1.forEach((_, value2) {
              // print(value['name']);
              // print(key1);
              print("\t");
              // print(value1);
              // print(key2);

              // print(value2['nameItem']);
            });
          });
        });
      }
      jsonDecode.forEach((map) {
        map.forEach((_, value) {
          value['item'].forEach((_, itemMap) {
            itemMap.forEach((_, itemDetail) {
              print("\t");
            });
          });
        });
      });

      count++;
    }
    print("end");

    int end1 = DateTime.now().millisecondsSinceEpoch;
    int result1 = start1 - end1;
    print(('${result1 * -1} #2'));
  } catch (e, s) {
    print(e);
    print(s);
  }
}

final data = [
  {
    "endPoint": "login",
    "data": {"name": "asta"}
  },
  {
    "endPoint": "login",
    "data": {"name": "yuno"}
  },
  {
    "endPoint": "logout",
    "data": {"message": "succest logout"}
  },
  {
    "endPoint": "register",
    "data": {"message": "succest register"}
  },
  {
    "endPoint": "addNewAdmin",
    "data": {"message": "succest add new admin"}
  },
  {
    "endPoint": "addNewitem",
    "data": {"message": "succest add new item"}
  }
];
