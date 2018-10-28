class AdaptiveStreamInfoParser {
  Map<String, String> _root;

  AdaptiveStreamInfoParser(this._root);

  int parseItag() => int.parse(_root['itag']);

  String parseUrl() => _root['url'];

  String parseSignature() => _root['s'];

  int parseContentLength() => int.parse(_root['clen']);

  int parseBitrate() => int.parse(_root['bitrate']);

  bool parseIsAudioOnly() => _root['type'].startsWith('audio/');

  int parseWidth() => 0;//_root["size"].SubstringUntil('x').ParseInt();

  int parseHeight() => 0;//_root["size"].SubstringAfter('x').ParseInt();

  int parseFramerate() => int.parse(_root['fps']);

  String parseQualityLabel() => _root['quality_label'];
}