class Node<T> {
  T? value;
  Node<T>? next;
  Node(this.value);
}

class LinkendList<T> {
  Node<T>? head; // Referensi ke node pertama dalam daftar
  bool get isEmpaty => head == null; // Periksa apakah daftarnya kosong

  // Tambahkan node baru ke akhir daftar
  void add(T value) {
    final newNode = Node<T>(value);
    if (isEmpaty) {
      // Jika daftar kosong, tetapkan node baru sebagai head
      head = newNode;
    } else {
      var curret = head;
      while (curret!.next != null) {
        // Telusuri daftar untuk menemukan node terakhir
        curret = curret.next;
      }
      curret.next = newNode;
      // Tetapkan node baru sebagai node berikutnya dari node terakhir
    }
  }

  void remove(T value) {
    if (isEmpaty) return;

    if (head?.value == value) {
      // Jika nilainya ada di node head, perbarui head ke node berikutnya
      head = head?.next;
      return;
    }

    var curret = head;
    while (curret!.next != null) {
      if (curret.next?.value == value) {
        // Jika nilai ditemukan di node berikutnya, lewati node berikutnya
        curret.next = curret.next?.next;
        return;
      }
      curret = curret.next;
    }
  }

  // Cetak nilai semua node dalam daftar
  void printL() {
    var curret = head;
    //print("is ${head?.value}");
    while (curret != null) {
      print(curret.value);
      curret = curret.next;
    }
  }
}

void main(List<String> args) {
  final linkendList = LinkendList<int>();
  var list;
  linkendList.add(90);
  linkendList.add(30);
  linkendList.add(87);
  linkendList.printL();
  linkendList.remove(87);
  print("////");
  linkendList.printL();

  var multiPlay = ((int b, int c) {
    print("$b and $c");
    print("");
  });
  multiPlay(9, 8);
}
