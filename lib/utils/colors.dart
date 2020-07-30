int parseHexColorFromString(String color, String opacity) {
  return int.parse(opacity + color, radix: 16);
}
