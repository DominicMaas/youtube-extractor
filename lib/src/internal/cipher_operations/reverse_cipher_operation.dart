import 'base_cipher_operation.dart';

class ReverseCipherOperation implements BaseCipherOperation {
  @override
  String decipher(String input) {
    return input.split('').reversed.join('');
  }
}
