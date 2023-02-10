extension LogEx on Object? {
  void log({bool isError = false}) =>
      print("${toString()}${this is Exception || isError ? " - Error" : ""}");
}
