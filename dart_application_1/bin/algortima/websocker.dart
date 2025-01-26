import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

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
  final String nameUser;
  final String classUser;
  final String nameTeacher;
  final String nisn;
  final String imageUser;
  final String imageNisn;
  final String status;
  final String time;
  final String? admin;
  final List items;

  BorrowUser({
    required this.nameUser,
    required this.classUser,
    required this.nameTeacher,
    required this.nisn,
    required this.imageUser,
    required this.imageNisn,
    required this.status,
    required this.items,
    required this.time,
    this.admin,
  });
  factory BorrowUser.from(Map json) {
    final list = [];
    for (var data in json['items']) {
      final index = Item.from(
          data['category'], data['id'], data['nameItem'], data['label']);
      list.add(index);
    }

    return BorrowUser(
      nameUser: json['name'],
      classUser: json['class'],
      nameTeacher: json['nameTeacher'],
      nisn: json['nisn'],
      imageUser: json['imageSelfie'],
      imageNisn: json['imageNisn'],
      status: json['status'],
      items: list,
      time: json['time'],
      admin: json['admin'],
    );
  }
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
          category: category);
  Map<String, dynamic> toJson() => {
        "status": status,
        "nameItem": name,
        "label": label,
        "image": image,
      };
}

class KeyCategoryList {
  final String key;
  final String id;
  KeyCategoryList({
    required this.key,
    required this.id,
  });

  factory KeyCategoryList.fromJson(Map<String, dynamic> json) =>
      KeyCategoryList(
        key: json['key'],
        id: json['id'],
      );
}

class WebsocketProvider {
  late WebSocketChannel _channel;
  final StreamController<Map> streamController =
      StreamController<Map>.broadcast();

  WebsocketProvider() {
    connect();
  }

  void getDataBorrow() {
    _channel.sink.add(json.encode({"endpoint": "getDataBorrow"}));
  }

  void getDataCategoryUser() {
    _channel.sink.add(json.encode({"endpoint": "getDataCollectionAvaileble"}));
  }

  void getDataAllCollection() {
    _channel.sink.add(json.encode({"endpoint": "getDataAllCollection"}));
  }

  void getDataPending() {
    _channel.sink.add(json.encode({"endpoint": "getDataPending"}));
  }

  void getAllKeyCategory() {
    _channel.sink.add(json.encode({"endpoint": "getAllKeyCategory"}));
  }

  void getDataGranted() {
    _channel.sink.add(json.encode({"endpoint": "getDataGranted"}));
  }

  void connect() async {
    _channel = WebSocketChannel.connect(Uri.parse('ws://127.0.0.1:8080/ws'));
    _channel.stream.listen(
      (message) {
        final streamData = json.decode(message);

        streamController.sink.add(streamData);
        // print(message);
      },
      onDone: () {
        print("losset connect web socket");
      },
      onError: (e) {
        print(e);
      },
    );
  }

  void sendMessage(Map<String, dynamic> message) {
    _channel.sink.add(
      json.encode(message),
    );
  }

  Stream<Map> responseLogin() async* {
    Map data = {};

    await for (var map in streamController.stream) {
      if (map['endpoint'] == 'LOGIN') {
        data.addAll(map);
        yield data;
      }
    }
  }

  Stream<Map> responseRegister() async* {
    Map data = {};

    await for (var map in streamController.stream) {
      if (map['endpoint'] == 'RIGISTER') {
        data.addAll(map);
        yield data;
      }
    }
  }

  Stream<String> verifikasi(String? token) async* {
    _channel.sink.add(json.encode(
      {
        "endpoint": "verifikasi",
        "data": {
          "token": token,
        }
      },
    ));

    await for (final status in streamController.stream) {
      if (status['endpoint'] == "VERIFIKASI") {
        yield status['status'];
      }
    }
  }

  // home: StreamBuilder(
  //   stream: FirebaseAuth.instance.authStateChanges(),
  //   builder: (context, snapshot) {
  //     if (snapshot.connectionState == ConnectionState.waiting) {
  //       return const SplashScreen();
  //     }
  //     if (snapshot.hasData) {
  //       print(snapshot.data!);
  //       return const ChatScreen();
  //     } else {
  //       return const HomeFirst();
  //     }
  //   },
  // ),

  Stream<List<BorrowUser>> borrowUser() async* {
    await for (var data in streamController.stream) {
      if (data['endpoint'] == 'GETDATABORROW') {
        final List<BorrowUser> list = [];

        if (data['message'].isEmpty) {
          yield [];
        }

        for (var i = 0; i < data['message'].length; i++) {
          final Map dataMessage = data['message'][i];
          for (var data in dataMessage.values) {
            if (data is Map) {
              final user = BorrowUser.from(data);
              list.add(user);
            }
          }
        }

        yield list;
      }
    }
  }

  Stream<List<BorrowUser>> pendingData() async* {
    await for (var data in streamController.stream) {
      if (data['endpoint'] == 'GETDATAPENDING') {
        final List<BorrowUser> list = [];

        if (data['message'].isEmpty) {
          yield [];
        }

        for (var i = 0; i < data['message'].length; i++) {
          final Map dataMessage = data['message'][i];
          for (var data in dataMessage.values) {
            if (data is Map) {
              final user = BorrowUser.from(data);
              list.add(user);
            }
          }
        }

        yield list;
      }
    }
  }

  Stream<List<BorrowUser>> userHasReturnItems() async* {
    await for (var data in streamController.stream) {
      if (data['endpoint'] == 'GETDATAGRANTED') {
        final List<BorrowUser> list = [];

        if (data['message'].isEmpty) {
          yield [];
        }
        for (var i = 0; i < data['message'].length; i++) {
          final Map dataMessage = data['message'][i];

          for (var data in dataMessage.values) {
            if (data is Map) {
              final user = BorrowUser.from(data);
              list.add(user);
            }
          }
        }

        yield list;
      }
    }
  }

  Future<List<KeyCategoryList>> keyCategory() async {
    List<KeyCategoryList> key = [];

    await for (var data in streamController.stream) {
      if (data['endpoint'] == "GETDATAALLKEYCATEGORY") {
        for (var i = 0; i < data['message'].length; i++) {
          final keyCategory = KeyCategoryList.fromJson(data['message'][i]);
          key.add(keyCategory);
        }
        return key;
      }
    }
    return [];
  }

  Stream<List<Index>> indexCategoryForUser(String title) async* {
    List<Index> data = [];

    await for (var index in streamController.stream) {
      if (index['endpoint'] == "GETDATACATEGORYAVAILEBLE") {
        if (index['message'].isEmpty) {
          yield [];
        }

        for (var i = 0; i < index['message'].length; i++) {
          if (index['message'][i][title] != null) {
            print("is empty");
            for (var entry in index['message'][i][title].entries) {
              final index = Index.fromJson(entry.value, entry.key, title);
              data.add(index);
            }
          }
        }

        yield data;
      }
    }
  }

  Stream<List<Index>> indexCategoryForAdmin(String title) async* {
    final List<Index> data = [];

    await for (var index in streamController.stream) {
      if (index['endpoint'] == "GETDATAALLCATEGORY") {
        if (index['message'].isEmpty) {
          yield [];
        }

        for (var i = 0; i < index['message'].length; i++) {
          if (index['message'][i][title] != null) {
            for (var entry in index['message'][i][title].entries) {
              final index = Index.fromJson(entry.value, entry.key, title);
              data.add(index);
            }
          }
        }

        yield data;
      }
    }
  }
}

//  _channel.sink.add(json.encode(
// {
//   "endpoint": "register",
//   "data": {
//     "name": name,
//     "password": password,
//     "addBy": nameAdmin,
//   },
// },
//   ));

//  final userBorrow = {
//     "name": "orion",
//     "class": "XVV",
//     "nisn": "123455",
//     "teacher": "andika s.t",
//     "time": "${DateTime.now()}",
//     "imageSelfie": base64Image,
//     "imageNisn": base64Image,
//   };

void main(List<String> args) async {
  int start1 = DateTime.now().millisecond;
  try {
    final wsHelper = WebsocketProvider();
    final convert = File("assets/black bull.jpeg").readAsBytesSync();
    String base64Image = base64Encode(convert);

    // wsHelper.sendMessage(
    //   {
    //     "endpoint": "login",
    //     "data": {
    //       "name": "astae",
    //       "password": "12345",
    //     },
    //   },
    // );

    await for (var element in wsHelper.verifikasi(
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFzdGEiLCJleHAiOjE3MzgyMzIzMTAsImlhdCI6MTczNTY0MDMxMH0.gc4ClQC-6wSu6ReKLzSKxL9YRoE_ERgcokCix8KEaX4')) {
      print(element);
    }

    int end1 = DateTime.now().millisecond;
    int result1 = start1 - end1;
    print(('${result1 * -1} #2'));
  } catch (e, s) {
    print(e);
    print(s);
  }
}

void test(List<String> args) async {
  try {
    final channel = IOWebSocketChannel.connect('ws://127.0.0.1:8080/ws');
    channel.stream.listen(
      (message) {
        final streamData = json.decode(message);
        // print(message);
        print(streamData.runtimeType); // == map
        print(streamData);
        for (var i = 0; i < streamData['message'].length; i++) {
          streamData['message'][i]['accesPoint'].forEach((k, v) {
            print(k);
            print(v);
            v.forEach((k1, v1) {
              print(v1);
            });
          });
        }
      },
      onDone: () {
        print("losset connect web socket");
      },
      onError: (e) {
        print(e);
      },
    );

    getDataAllCollection(channel);
  } catch (e) {
    print(e);
  }
}

void getDataAllCollection(WebSocketChannel channel) {
  channel.sink.add(json.encode({"endpoint": "getDataAllCollection"}));
}

void getDataCategoryUser(WebSocketChannel channel) {
  channel.sink.add(json.encode({"endpoint": "getDataCollectionAvaileble"}));
}

void getAllKeyCategory(WebSocketChannel channel) {
  channel.sink.add(json.encode({"endpoint": "getAllKeyCategory"}));
}

void getDataBorrow(WebSocketChannel channel) {
  channel.sink.add(json.encode({"endpoint": "getDataBorrow"}));
}

void handleResponse(String data) {
  final decode = json.decode(data);

  if (decode['message']) {}
}

void register(WebSocketChannel socket) {
  socket.sink.add(json.encode(
    {
      "endpoint": "verifikasi",
      "data": {
        "token":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFzdGEiLCJleHAiOjE3MzYwNDE3MTMsImlhdCI6MTczMzQ0OTcxM30.WtLTtLAIY82hfw_x37kpyL8V7lvHOPs8etzPT0tRJ98"
      }
    },
  ));
}

void login(
  WebSocketChannel socket,
) async {
  socket.sink.add(json.encode(
    {
      "endpoint": "login",
      "data": {
        "name": "yami",
        "password": "black-shdow",
      },
    },
  ));
  // await Future.delayed(Duration(milliseconds: 500));

  // not heve send data same time because had isssue in open db so only can send 1 message to ws
  socket.sink.add(json.encode(
    {
      "endpoint": "login",
      "data": {"name": "yuno", "password": "12344"},
    },
  ));
}

void addNewItem(WebSocketChannel socket) {
  socket.sink.add(json.encode({
    "endpoint": "addNewCollection",
    "data": {
      "category": "cable lan",
    },
  }));
}

void addNewItemToCollection(WebSocketChannel socket) {
  socket.sink.add(json.encode({
    "endpoint": "addNewItem",
    "data": {
      "category": "monitor",
      "name": "asus lqd",
      "label": "jk455",
      "image": "-",
    },
  }));
}

void delete(WebSocketChannel socket) {
  socket.sink.add(json.encode({
    "endpoint": "deleteItem",
    "data": {
      "category": "monitor",
      "index": "1",
    },
  }));
}

void update(WebSocketChannel socket) {
  socket.sink.add(json.encode(
    {
      "endpoint": "updateStatusItem",
      "data": {
        "category": "accesPoint",
        "index": "1",
      }
    },
  ));
}

void borrow(WebSocketChannel socket) {
  final convert = File("assets/black bull.jpeg").readAsBytesSync();
  String base64Image = base64Encode(convert);
  final proviusDataItem = {
    "accesPoint": {
      "1": {},
    },
    "mikrotick": {
      "1": {},
    }
  };

  final newDataItem = [
    {
      "category": "accessPoint",
      "id": "1",
      "label": "no 1",
      "nameItem": "tp Link",
      "image": "-",
      "status": "available"
    },
    {
      "category": "accessPoint",
      "id": "2",
      "label": "no 24",
      "nameItem": "tp Link",
      "image": "-",
      "status": "available"
    },
    {
      "category": "mikrotick",
      "id": "1",
      "label": "no 21",
      "nameItem": "cisco",
      "image": "-",
      "status": "available"
    }
  ];

  socket.sink.add(json.encode(
    {
      "endpoint": "borrowing",
      "data": {
        "name": "zamzam",
        "class": "XVV",
        "nisn": "123455",
        "teacher": "andika s.t",
        "imageSelfie": base64Image,
        "imageNisn": base64Image,
        "time": "",
        "item": proviusDataItem
      }
    },
  ));
}

void checkUser(WebSocketChannel socket) {
  socket.sink.add(json.encode(
    {
      "endpoint": "checkUserBorrow",
      "data": {
        "name": "deon",
      }
    },
  ));
}

void waitPermision(WebSocketChannel socket) {
  socket.sink.add(json.encode(
    {
      "endpoint": "waitPermision",
      "data": {
        "name": "yuno",
      },
    },
  ));
}

void granted(WebSocketChannel socket) {
  socket.sink.add(json.encode(
    {
      "endpoint": "granted",
      "data": {
        "admin": "reja",
        "name": "zamzam",
        "dateTime": "${DateTime.now()}",
      },
    },
  ));
}

void getDataCollection(WebSocketChannel socket) {
  socket.sink.add(
    json.encode(
      {
        "endpoint": "getDataCollection",
        "data": {
          "collection": "accesPoint",
        }
      },
    ),
  );
}
