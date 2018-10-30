/// Thrown when there was an error parsing some data.
class ParseException implements Exception {
  String message;

  ParseException([this.message]);

  @override
  String toString() {
    if (message == null) return "ParseException";
    return "ParseException: $message";
  }
}
