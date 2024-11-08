String? updateLight1(String current) {
  if (current == "green") {
    return "yellow";
  } else if (current == "yellow") {
    return "red";
  } else {
    return "greeen";
  }
}

String? updateLight(String current) => current == "green"
    ? "yellow"
    : current == "yellow"
        ? "red"
        : "green";
//green, to yellow, to red, and then to green

void main() {
  print(updateLight("yellow"));
}
