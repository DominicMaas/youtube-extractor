import 'cipher_operations/base_cipher_operation.dart';

class PlayerSource {
  List<BaseCipherOperation> cipherOperations;

  PlayerSource(this.cipherOperations);

  String decipher(String input) {
    cipherOperations.forEach((operation) {
      input = operation.decipher(input);
    });

    return input;
  }
}
