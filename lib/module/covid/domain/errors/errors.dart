class CovidException implements Exception{
  final String message;

  CovidException(this.message);

  @override
  String toString() => "$CovidException(message: $message)";
}