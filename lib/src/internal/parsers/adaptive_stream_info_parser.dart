class AdaptiveStreamInfoParser {
  Map<String, String> _root;

  AdaptiveStreamInfoParser(this._root);

  int parseItag() => _getInt(_root['itag']);

  String parseUrl() => _root['url'];

  String parseSignature() => _root['s'];

  // if there is &sp=sig signiture parameter must name 'sig' instead of 'signiture'
  String parseSp() => _root['sp'];

  int parseContentLength() => _getInt(_root['clen']);

  int parseBitrate() => _getInt(_root['bitrate']);

  bool parseIsAudioOnly() => _root['type']?.startsWith('audio/');

  int parseWidth() => 0; //_root["size"].SubstringUntil('x').ParseInt();

  int parseHeight() => 0; //_root["size"].SubstringAfter('x').ParseInt();

  int parseFramerate() => _getInt(_root['fps']);

  int _getInt(String string) {
    if (string == null) {
      return null;
    }

    return int.tryParse(string);
  }
}
