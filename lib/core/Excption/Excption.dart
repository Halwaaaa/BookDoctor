class internetConectionEx implements Exception {
  final String message;
  internetConectionEx(this.message);

  @override
  String toString() {
    return message;
  }
}
