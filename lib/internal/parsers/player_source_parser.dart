class PlayerSourceParser {
  String _raw;

  PlayerSourceParser(this._raw);

  List<ICipherOperation> parseCipherOperations() {

  }

  static PlayerSourceParser initialize(String raw) {
    return PlayerSourceParser(raw);
  }
}