import 'base_cipher_operation.dart';

class SwapCipherOperation implements BaseCipherOperation {
  int _index;

  SwapCipherOperation(this._index);

  @override
  String decipher(String input) {
    var splitString = input.split('');

    splitString[0] = input[_index];
    splitString[_index] = input[0];

    return splitString.join();
  }
}
