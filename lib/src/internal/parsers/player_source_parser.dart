import '../../exceptions/parse_exception.dart';
import '../cipher_operations/base_cipher_operation.dart';
import '../cipher_operations/reverse_cipher_operation.dart';
import '../cipher_operations/slice_cipher_operation.dart';
import '../cipher_operations/swap_cipher_operation.dart';

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
    var entryPoint = RegExp(r"\b[a-z]+\s*&&\s*[a-z]+\.set\([^,]+\s*,\s*(?:encodeURIComponent\s*\()?\s*([a-zA-Z0-9$]+)\(")
        .firstMatch(_raw)
        .group(1);
    if (entryPoint == null) {
      throw ParseException(
          'Could not find the entry function for signature deciphering.');
    }

    // Find the body of the function
    var entryPointPattern =
        r"(?!h\.)" + RegExp.escape(entryPoint) + r"=function\(\w+\)\{(.*?)\}";
    var entryPointBody = RegExp(entryPointPattern).firstMatch(_raw).group(1);
    if (entryPointBody == null) {
      throw ParseException(
          'Could not find the signature decipherer function body.');
    }
    var entryPointLines = entryPointBody.split(';').toList();

    // Identify cipher functions
    String reverseFuncName = null;
    String sliceFuncName = null;
    String charSwapFuncName = null;
    var operations = new List<BaseCipherOperation>();

    // Analyze the function body to determine the names of cipher functions
    for (var i = 0; i < entryPointLines.length; i++) {
      // Break when all functions are found
      if (reverseFuncName != null &&
          sliceFuncName != null &&
          charSwapFuncName != null) {
        break;
      }

      // Get the function called on this line
      var calledFuncName =
          RegExp(r"\w+\.(\w+)\(").firstMatch(entryPointLines[i]).group(1);
      if (calledFuncName == null) {
        continue;
      }

      // Find cipher function names
      if (RegExp(RegExp.escape(calledFuncName) + r":\bfunction\b\(\w+\)")
          .hasMatch(_raw)) {
        reverseFuncName = calledFuncName;
      } else if (RegExp(RegExp.escape(calledFuncName) +
              r":\bfunction\b\([a],b\).(\breturn\b)?.?\w+\.")
          .hasMatch(_raw)) {
        sliceFuncName = calledFuncName;
      } else if (RegExp(RegExp.escape(calledFuncName) +
              r":\bfunction\b\(\w+\,\w\).\bvar\b.\bc=a\b")
          .hasMatch(_raw)) {
        charSwapFuncName = calledFuncName;
      }
    }

    // Analyze the function body again to determine the operation set and order
    for (var i = 0; i < entryPointLines.length; i++) {
      // Get the function called on this line
      var calledFuncName =
          RegExp(r"\w+\.(\w+)\(").firstMatch(entryPointLines[i]).group(1);
      if (calledFuncName == null) {
        continue;
      }

      if (calledFuncName == charSwapFuncName) {
        // Swap operation
        var index = int.tryParse(
            RegExp(r"\(\w+,(\d+)\)").firstMatch(entryPointLines[i]).group(1));
        operations.add(SwapCipherOperation(index));
      } else if (calledFuncName == sliceFuncName) {
        // Slice operation
        var index = int.tryParse(
            RegExp(r"\(\w+,(\d+)\)").firstMatch(entryPointLines[i]).group(1));
        operations.add(SliceCipherOperation(index));
      } else if (calledFuncName == reverseFuncName) {
        // Reverse operation
        operations.add(ReverseCipherOperation());
      }
    }

    return operations;
  }

  static PlayerSourceParser initialize(String raw) {
    return PlayerSourceParser(raw);
  }
}
