class MuxedStreamInfoParser {
  Map<String, String> _root;

  MuxedStreamInfoParser(this._root);

  int ParseItag() => _root['itag'] as int;

  String ParseUrl() => _root['url'];

  String ParseSignature() => _root['s'];
}