import 'package:youtube_extractor/exceptions/parse_exception.dart';
import 'package:youtube_extractor/internal/cipher_operations/base_cipher_operation.dart';

class PlayerSourceParser {
  String _raw;

  PlayerSourceParser(this._raw);

  List<BaseCipherOperation> parseCipherOperations() {
    // Original code credit:
    // https://github.com/flagbug/YoutubeExtractor/blob/3106efa1063994fd19c0e967793315f6962b2d3c/YoutubeExtractor/YoutubeExtractor/Decipherer.cs
    // No copyright, MIT license
    // Regexes found in this method have been sourced by contributors and from other projects
    // Sourced from https://github.com/Tyrrrz/YoutubeExplode/blob/6227f90d974e75b342c803f076f9d2688d0f403c/YoutubeExplode/Internal/Parsers/PlayerSourceParser.cs

    // Find the name of the function that handles deciphering
    var entryPoint = RegExp(r"(\w+)&&(\w+)\.set\(\w+,(\w+)\(\1\)\);return\s+\2").firstMatch(_raw).group(3);
    if (entryPoint == null) {
      throw ParseException('Could not find the entry function for signature deciphering.');
    }

    // Find the body of the function
    return List<BaseCipherOperation>();
  }

  static PlayerSourceParser initialize(String raw) {
    return PlayerSourceParser(raw);
  }
}