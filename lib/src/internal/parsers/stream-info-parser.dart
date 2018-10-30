import 'package:xml/xml.dart' as xml;

class StreamInfoParser {
  xml.XmlDocument _root;

  StreamInfoParser(this._root);

  int parseItag() => int.tryParse(_root.attributes.firstWhere((x) => x.name == 'id').value);

  String parseUrl() => _root.attributes.firstWhere((x) => x.name == 'BaseURL').value; 

  int parseContentLength() => int.tryParse(RegExp(r'clen[/=](\d+)').firstMatch(parseUrl()).group(1));

  int parseBitrate() => int.tryParse(_root.attributes.firstWhere((x) => x.name == 'bandwidth').value); 

  bool parseIsAudioOnly() => _root.attributes.firstWhere((x) => x.name == 'AudioChannelConfiguration') != null; 

  int parseWidth() => int.tryParse(_root.attributes.firstWhere((x) => x.name == 'width').value); 

  int parseHeight() => int.tryParse(_root.attributes.firstWhere((x) => x.name == 'height').value); 

  int parseFramerate() => int.tryParse(_root.attributes.firstWhere((x) => x.name == 'frameRate').value);
}
