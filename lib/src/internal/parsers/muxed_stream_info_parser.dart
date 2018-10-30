class MuxedStreamInfoParser {
  Map<String, String> _root;

  MuxedStreamInfoParser(this._root);

  int parseItag() => _getInt(_root['itag']);

  String parseUrl() => _root['url'];

  String parseSignature() => _root['s'];

  int _getInt(String string) {
    if (string == null) {
      return null;
    }

    return int.tryParse(string);
  }
}
