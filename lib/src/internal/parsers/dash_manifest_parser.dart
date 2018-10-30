import 'stream-info-parser.dart';
import 'package:xml/xml.dart' as xml;

class DashManifestParser {
  xml.XmlDocument _root;

  DashManifestParser(this._root);

  List<StreamInfoParser> getStreamInfo() {
    var streamInfosXml = _root.descendants
        .where((x) => x is xml.XmlElement && x.name.local == 'Representation')
        .toList();

    // List that we will full
    var builtList = List<StreamInfoParser>();

    streamInfosXml.forEach((x) {
      builtList.add(StreamInfoParser(x));
    });

    return builtList;
  }

  static DashManifestParser initialize(String raw) {
    var root = xml.parse(raw);
    return DashManifestParser(root);
  }
}
