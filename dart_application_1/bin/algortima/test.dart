import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:collection';
import 'dart:math';
import 'package:http/http.dart' as http;
//import 'package:tflite_flutter/tflite_flutter.dart';
//import 'package:dart_application_1/dart_application_1.dart';

//import 'package:dart_tensor/dart_tensor.dart';

class ReadJson {
  late final String category;
  late final String name;
  late final String description;
  late final int price;
  late final String image;

  ReadJson(
      {required this.category,
      required this.name,
      required this.description,
      required this.image,
      required this.price});

  factory ReadJson.fromJson(Map<String, dynamic> json) {
    return ReadJson(
      category: json["kategori"],
      name: json['nama'],
      description: json['deskripsi'],
      price: json['harga'],
      image: json['gambar'],
    );
  }
}

List<ReadJson> filterFromCategory(List<ReadJson> item, String category) {
  return item.where((items) => items.category == category).toList();
}

Future<List<ReadJson>> read({required String paht}) async {
  final String filePath = paht;

  String json = File(filePath).readAsStringSync();

  final Map<String, dynamic> data = jsonDecode(json);
  List<ReadJson> items =
      (data["menu"] as List).map((e) => ReadJson.fromJson(e)).toList();

  return items;
}

Stream<List<double>> dataStream() async* {
  List<List<double>> data = [
    [
      26539.67382812,
      26608.69335938,
      26568.28125,
      26534.1875,
      26754.28125,
      26579.390625,
      26256.82617188,
      26298.48046875,
      2233333.22222222
    ],
    [
      26217.25,
      26352.71679688,
      27021.546875,
      26911.72070312,
      26967.91601562,
      27983.75,
      27391.01953125,
      26873.3203125,
      26756.79882812,
      26862.375,
      26861.70703125
    ],
  ];

  for (var datas in data) {
    await Future.delayed(Duration(seconds: 3));
    yield datas;
  }
}

Future<List<double>> model(Queue queue) {
  var tem;
  while (queue.isNotEmpty) {
    final List<double> dataList = [];
    for (var data in queue) {
      dataList.addAll(data);
    }
    print('$queue ========');
    tem = dataList;
    print('$dataList ```````````');
    queue.removeFirst();
  }

  print('$queue ----------');
  print('$tem ====T====');

  return tem;
}

Future<List<double>> newDatas() async {
  final List<double> newData = [];
  List<double> data = [3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5];
  for (var i = 0; i <= data.length - 2 + 1; i++) {
    var tem = newData.sublist(i, i + 2);
    newData.addAll(tem);
    print("$newData ====");
  }
  return newData;
}

List<List<T>> reshape<T>(
    {required List<List<T>> list, required int col, required int row}) {
  List<T> flatten = list
      .expand(
        (element) => element,
      )
      .toList();

  int requiredSize = col * row;

  if (flatten.length > requiredSize) {
    flatten = flatten.sublist(0, requiredSize);
  } else if (flatten.length < requiredSize) {
    flatten.addAll(List.filled(requiredSize - flatten.length, 1.000 as T));
  }

  List<List<T>> results = [];
  for (var i = 0; i < row; i++) {
    results.add(flatten.sublist(i * col, (i + 1) * col));
  }
  return results;
}

Future<List<double>> fetch() async {
  final Queue<List<double>> queue = Queue<List<double>>();
  final Completer<List<double>> dataModel = Completer<List<double>>();
  final List<double> list = [];

  var dataStreams = dataStream();
  dataStreams.listen(
    (event) async {
      queue.add(event);
      while (queue.isNotEmpty) {
        final List<double> listTemp = [];
        for (var data in queue) {
          listTemp.addAll(data);
        }

        try {
          for (var t in listTemp) {
            print("${t.floor()} \n");
            list.add(t);
          }
        } catch (e) {
          print(e);
        }
        print("404");
        queue.removeFirst();
      }
    },
    onDone: () {
      print("${queue.length} queue");
      dataModel.complete(list);
    },
  );
  ;

  return dataModel.future;
}

class Test {
  final double first;
  final double second;
  final double three;

  Test({required this.first, required this.second, required this.three});
}

Stream<List<double>> number(List<double> dataList) async* {
  List<List<double>> list = [];

  final List<double> list1 = [];
  final List<double> list2 = [];

  List<List<double>> data = [dataList];

  list1.addAll(data[0]);
  await Future.delayed(Duration(seconds: 2));

  bool chek = true;

  while (chek) {
    if (list1.isNotEmpty) {
      list.add(list1);
    }
    if (list2.isNotEmpty) {
      list.add(list2);
    }
    chek = false;
  }

  for (var element in list) {
    await Future.delayed(Duration(seconds: 2));
    yield element;
  }
}

Future<List<Test>> dataTest() {
  Queue<List<double>> queue = Queue<List<double>>();
  final Completer<List<Test>> controler = Completer<List<Test>>();
  final Stream<List<double>> resuts = number(
    [43.09, 41.09, 96.0, 90.9, 98.9, 89.9, 12.9],
  );
  List<Test> finals = [];
  resuts.listen(
    (event) {
      if (event.isNotEmpty) {
        queue.add(event);
      }

      print("$event  event");
      while (queue.isNotEmpty) {
        List<double> data = [];

        for (var element in queue) {
          data.addAll(element);
        }

        double minData = data.reduce(min);
        double maxData = data.reduce(max);

        final fits = data.first + minData;
        final second = data[data.length ~/ 2] + minData;
        final three = data.last - minData + maxData;

        finals.add(Test(first: fits, second: second, three: three));
        queue.removeFirst();
      }
    },
    onDone: () => controler.complete(finals),
    onError: (error) => controler.completeError(error),
  );
  print("$queue len");
  return controler.future;
}

enum Category { close, open }

final dataCategory = {Category.close: "close", Category.open: "open"};

class DataMachineLearning {
  final double lastDate;
  final double predictionStock;

  DataMachineLearning({
    required this.lastDate,
    required this.predictionStock,
  });
}

Future<List<DataMachineLearning>> process(List<double> data) {
  final Queue<List<double>> queue = Queue<List<double>>();
  final Completer<List<DataMachineLearning>> controler =
      Completer<List<DataMachineLearning>>();

  /* below this stream for listen data from api stock*/
  final Stream<List<double>> stream = number(data);
  final List<DataMachineLearning> pred = [];
  bool check = false;
  stream.listen(
    (event) async {
      queue.add(event);

      /*below this for proses data from api to model*/
      while (queue.isNotEmpty) {
        final List<double> dataList = [];
        for (var data in queue) {
          dataList.addAll(data);
        }
        double minData = dataList.reduce(min);
        double maxData = dataList.reduce(max);

        List<double> normalisasiData = [];
        for (var i = 0; i < dataList.length; i++) {
          normalisasiData.add((dataList[i] - minData) / (maxData - minData));
        }

        int nSteps = 3;
        List<List<double>> newData = [];

        for (var i = (normalisasiData.length) - nSteps - 1; i > 0; i--) {
          var tem = normalisasiData.sublist(i, i + nSteps);
          newData.add(tem);
        }

        final reshapeShape = [8, 1];
        final int requiredLength = reshapeShape.reduce(
          (value, element) => value * element,
        );

        if (newData.length % requiredLength != 0) {
          final validLen = newData.length - (newData.length % requiredLength);
          newData = newData.sublist(0, validLen);
        }

        newData = reshape(list: newData, col: 1, row: 8);

        /* below reshpe data in newData*/
        // final input = newData.reshape(reshapeShape);
        // final output = List.filled(1, 0).reshape([1, 1]);

        /*below  for model machine learning  */

        /*this try catch for make sure is run */
        // try {
        //   Interpreter model =
        //       await Interpreter.fromAsset('assets/model.tflite');
        //   model.run(input, output);
        // } catch (e) {
        //   print("$e  e");
        // }

        /* beloe for prediction data from user*/
        final double prediction =
            newData.first[0] * (maxData - minData) + minData;
        final double predictionResults = prediction * 0.977;
        final double lastStock = dataList.last;
        // below for send data to database
        /*
         below code for send data to list <dataModel> 
        DataModel.add(DataModelprediction:predictionStock,LastOpen:lastStock))
        */

        pred.add(DataMachineLearning(
          lastDate: lastStock,
          predictionStock: predictionResults,
        ));
        print("${pred.length}            ----");
        queue.removeFirst();
      }

      // print("$queue     queue");
    },
    /*below this for data in body listen is compled data can be return */
    onDone: () {
      if (!check) {
        controler.complete(pred);
        check = true;
      }
    },
    onError: (error) {
      if (!check) {
        controler.completeError(error);
        check = true;
      }
    },
  );
  print("pred $pred");
  return controler.future;
}

void getValue() async {
  try {
    // final data = await process([
    //   222.77,
    //   220.85,
    //   222.38,
    //   220.82,
    //   220.91,
    //   220.11,
    //   222.66,
    //   222.77,
    //   222.5
    // ]);
    //print("${data.length}        data");
    print("object");
  } catch (e, stackTrace) {
    print(e);
    print(stackTrace);
  }
}

Stream<List<Map<String, dynamic>>> dataChat() async* {
  try {
    final httpGet = Uri.parse(
        'https://chat-app-8122b-default-rtdb.asia-southeast1.firebasedatabase.app/main.json');
    final response = await http.get(httpGet);

    List<Map<String, dynamic>> dataUser = [];
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      for (var element in data.entries) {
        // print(element.value["email"]);
        // print(element.key);
        // if (element.key == id) {
        //   print("${element.value["email"]} curret id");
        // // }
        dataUser.add(
          {
            "email": element.value["email"],
            'name': element.value["name"],
            "id": element.value["id"]
          },
        );
      }
    }
    yield dataUser;
  } catch (e, stackTrace) {
    print("$e");
    print("$stackTrace");
  }
}

// final stream = dataChat();
// stream.listen(
//   (event) {
//     Queue<Map<String, dynamic>> stack = Queue<Map<String, dynamic>>();
//     for (var element in event) {
//       // if (element["id"] == "satu") {
//       //   print(element["email"]);
//       //   print(element["name"]);
//       //   print(element["id"]);
//       // }
//       stack.addFirst(
//         {
//           "name": element["name"],
//           "email": element["email"],
//           "id": element["id"]
//         },
//       );
//     }
//     print(stack);
//   },

// );

Stream<List> retrunData() async* {
  final data = [
    [1, 2, 3, 4, 5, 6, 6],
    [5, 6, 4, 3, 3, 3],
    [5, 7, 8, 2, 3, 4, 3],
    [4, 5, 6, 3, 4, 4, 5]
  ];
  for (var el in data) {
    yield el;
  }
}

final list = [];

Stream<String> response() async* {
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
  final encode = json.encode(data);
  yield encode;
}

class Ws {
  final StreamController streamController = StreamController();
  Completer<List> _dataCompleter = Completer<List>();
  Stream<List> get data => _dataCompleter.future.asStream();

  Ws() {
    connect();
  }

  void connect() async {
    final stream = response(); // Assuming this returns a Stream<String>

    stream.listen(
      (event) {
        final decode = json.decode(event);
        if (!_dataCompleter.isCompleted) {
          // Only complete the completer once
          _dataCompleter.complete(decode);
        }

        streamController.add(decode);
      },
      onDone: () {
        print("done");
      },
    );
  }

  Stream login() async* {
    List<Map> data = [];
    await for (var index in streamController.stream) {
      if (index.first['endPoint'] == 'login') {
        data.add(index.first);
      }
    }

    yield data;
  }
}

void main() async {
  // final convert = File("assets/black bull.jpeg").readAsBytesSync();
  // String base64Image = base64Encode(convert);
  // print(base64Image);
  // final complet = Completer<Map>();
  final Ws ws = Ws();
  await for (var data in ws.login()) {
    print(data);
  }
  // await for (var data in stream) {
  //   print(data.runtimeType);
  //   print(data);
  // }
  // final future = complet.future.asStream();
  // print(future);
}

void get(Map data) {
  // resuts.addAll(data);
  // print("$data data");
}

String generateRandomString(int length) {
  const chars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#\$%^&*()_+';
  Random rnd = Random();
  return List.generate(length, (index) => chars[rnd.nextInt(chars.length)])
      .join();
}

void test() {
  String urlUser = 'HTtp://172.170  .1.1';
  final current = urlUser.replaceAll(" ", "");
  print(current);

  if (urlUser.replaceAll(" ", '').toLowerCase() == 'http://172.170.1.1') {
    print("success");
  } else {
    print("failed");
  }
  Queue<Map<String, dynamic>> stack = Queue<Map<String, dynamic>>();
  stack.addLast({"id": 1});
  stack.addLast({"id": 2});
  stack.addLast({"id": 3});
  stack.addLast({"id": 4});
  stack.addLast({"id": 5});
  for (var data in stack) {
    print(data);
  }
}

//222.77, 220.85, 222.38, 220.82, 220.91, 220.11, 222.66, 222.77, 222.5]}
// try {
//     final stream = await dataTest();

//     print(stream.length);

//     for (var element in stream) {
//       print("\t");
//       print(
//           "first ${element.first} second ${element.second} second ${element.three}");
//     }

//     print("done");
//   } catch (e, stackTrace) {
//     print(e);
//     print(stackTrace);
//   }
//void main(List<String> args) async {
// try {
//   List<ReadJson> readJson = await read(paht: "assets/Api.json");
//   for (var data in readJson) {
//     print(data.name);
//     print(data.image);
//     print(data.description);
//     print(data.price);
//     print('\n');
//   }
// } catch (e, stackTrace) {
//   print(e);
//   print(stackTrace);
// }

// final List<List<double>> results = [];

// List<List<double>> streamData = await dataStream().toList();
// for (var data in streamData) {
//   queue.add(data);
// }
// var datafinal = [];
// try {
//   var data = number();
//   data.listen(
//     (event) {
//       datafinal.add(event);
//       print("$event 77");
//     },
//   );
// } catch (e, stackTrace) {
//   print(e);
//   print(stackTrace);
// }

// print("$datafinal 99");
// for (var element in data) {
//   print("$element \n len");
// }

// List<List<double>> temporary = [
//   [
//     82.22222222,
//     22.222000,
//     3.222233,
//     423.43444,
//     82.22222222,
//     22.222000,
//     3.222233,
//     423.43444,
//     82.22222222,
//     22.222000,
//     3.222233,
//     82.22222222,
//     22.222000,
//     3.222233,
//   ]
// ];
// List<List<double>> row = reshape(list: temporary, col: 6, row: 8);

// for (var data in row) {
//   print(" $data  ");
// }
//}

// Connecting to VM Service at ws://127.0.0.1:54524/hdXn_rKhVC4=/ws
// Meat Lover
// /foto.jpeg
// Irisan sosis sapi, daging sapi cincang, burger sapi, sosis ayam.
// 49500

// Green Tea Shake
// /hallo.jpeg

// 24000

// Super Supreme
// /foto.jpeg
// Daging ayam dan sapi asap, daging sapi cincang, burger sapi, jamur, paprika merah dan paprika hijau.
// 49500

// Tuna Melt
// /hallo.jpeg
// Irisan daging ikan tuna, butiran jagung, saus mayonnaise.
// 49500

// American Favourite
// /foto.jpeg
// Pepperoni sapi, daging sapi cincang, jamur.
// 49500

// Beef Spaghetti
// /foto.jpeg
// Pepperoni sapi, daging sapi cincang, jamur.
// 43000

//

// Oriental Chicken
// /hallo.jpeg
// Daging ayam berpadu dengan saus oriental.
// 40000

// Choco Mint
// /foto.jpeg

// 24000

// Toffee Coffee
// /hallo.jpeg

// 24000

// Strawberry Milkshake
// /foto.jpeg

// 24000

// Chocolate Milkshake
// /hallo.jpeg

// 24000

// Exited.
