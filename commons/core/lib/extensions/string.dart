extension StringParsing on String {
  bool parseBool() {
    final lowerCasedValue = toLowerCase();
    if (lowerCasedValue == 'true' || lowerCasedValue == '1') {
      return true;
    } else if (lowerCasedValue == 'false' || lowerCasedValue == '0') {
      return false;
    }
    throw FormatException('Invalid string for boolean conversion: $this');
  }
}

extension StringFormat on String {
  String get removePhoneFormat {
    return replaceAll(RegExp("[^0-9]"), "").replaceAll(" ", "");
  }
}