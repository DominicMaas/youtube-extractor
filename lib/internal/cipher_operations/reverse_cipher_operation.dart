import 'package:youtube_extractor/internal/cipher_operations/base_cipher_operation.dart';

class ReverseCipherOperation implements BaseCipherOperation {
  @override
  String decipher(String input) {
    return input.split('').reversed.join('');
  }
}
