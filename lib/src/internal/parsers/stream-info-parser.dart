import 'package:xml/xml.dart' as xml;

class StreamInfoParser {
  xml.XmlElement _root;

  StreamInfoParser(this._root);

  int parseItag() => int.tryParse(
      _root.attributes.firstWhere((x) => x.name.local == 'id').value);

  String parseUrl() => _root.descendants
      .firstWhere((x) => x is xml.XmlElement && x.name.local == 'BaseURL')
      .text;

  int parseContentLength() =>
      int.tryParse(RegExp(r'clen[/=](\d+)').firstMatch(parseUrl()).group(1));

  int parseBitrate() => int.tryParse(
      _root.attributes.firstWhere((x) => x.name.local == 'bandwidth').value);

  bool parseIsAudioOnly() => _root.descendants.any((x) =>
      x is xml.XmlElement && x.name.local == 'AudioChannelConfiguration');

  int parseWidth() => int.tryParse(
      _root.attributes.firstWhere((x) => x.name.local == 'width')?.value);

  int parseHeight() => int.tryParse(
      _root.attributes.firstWhere((x) => x.name.local == 'height')?.value);

  int parseFramerate() => int.tryParse(
      _root.attributes.firstWhere((x) => x.name.local == 'frameRate')?.value);
}
