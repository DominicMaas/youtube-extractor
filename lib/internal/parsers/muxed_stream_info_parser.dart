class MuxedStreamInfoParser {
  Map<String, String> _root;

  MuxedStreamInfoParser(this._root);

  int parseItag() => int.parse(_root['itag']);

  String parseUrl() => _root['url'];

  String parseSignature() => _root['s'];
}