import 'base_cipher_operation.dart';

class SliceCipherOperation implements BaseCipherOperation {
  int _index;

  SliceCipherOperation(this._index);

  @override
  String decipher(String input) {
    return input.substring(_index);
  }
}
