void main(List<String> args) {
  List<String> text = ["az", "toto", "picaro", "zone", "kiwi"];
  List<List<String>> res = [];
  List<String> timearr = [];
  for (var i = 1; i < text.length; i++) {
    timearr.add(text.sublist(0, i).join(' '));
    timearr.add(text.sublist(i).join(' '));
    res.add(timearr);
    timearr = [];
  }
  print(res);
}
