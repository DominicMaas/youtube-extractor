class StreamInfoParser {
  int parseItag() => null; // (int) _root.Attribute("id");

  String parseUrl() => null; // (string) _root.Element("BaseURL");

  int parseContentLength() =>
      null; // Regex.Match(ParseUrl(), @"clen[/=](\d+)").Groups[1].Value.ParseLong();

  int parseBitrate() => null; // (long) _root.Attribute("bandwidth");

  bool parseIsAudioOnly() =>
      null; // _root.Element("AudioChannelConfiguration") != null;

  int parseWidth() => null; // (int) _root.Attribute("width");

  int parseHeight() => null; // (int) _root.Attribute("height");

  int parseFramerate() => null; //(int) _root.Attribute("frameRate");
}
