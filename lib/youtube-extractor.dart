import 'package:http/http.dart' as http;
import 'package:youtube_extractor/models/player-context.dart';

/// Dart port of YouTubeExplode
class YouTubeExtractor {
  
  Future<PlayerContext> _getVideoPlayerContextAsync(String videoId) async {
    // Build the required url and get the response
    var url = 'https://www.youtube.com/embed/$videoId?disable_polymer=true&hl=en';
    var body = (await http.get(url)).body;
    
    print(body);


   
    // Extract info
    var playerSourceUrl = 'null'; // var relativeUrl = _root["assets"]["js"].Value<string>();
    // if (relativeUrl.IsNotBlank())
    // relativeUrl = "https://www.youtube.com" + relativeUrl;
    // return relativeUrl;

    var sts = 'null'; //public string ParseSts() => _root["sts"].Value<string>();

    // Check if successful
    if (playerSourceUrl == null || playerSourceUrl.isEmpty || sts == null || sts.isEmpty)
      throw Exception("Could not parse player context.");

    return PlayerContext(playerSourceUrl, sts);
  }
  
  /// Gets a set of all available media stream infos for given video.
  Future<void> getVideoMediaStreamInfosAsync(String videoId) async {
    
    // Make sure the ID is valid
    if (!validateVideoId(videoId)) {
      throw ArgumentError('Invalid YouTube video ID [$videoId].');
    }

    // Get player context
    var playerContext = await _getVideoPlayerContextAsync(videoId);
  }

  /// Verifies that the given string is syntactically a valid YouTube video ID.
  bool validateVideoId(String videoId) {
    
    // The user has not passed in a video ID at all
    if (videoId == null || videoId.isEmpty) {
      return false;
    }

    // Video IDs are always 11 characters
    if (videoId.length != 11) {
      return false;
    }

    // Try match the regex expression
    return !RegExp(r"[^0-9a-zA-Z_\-]").hasMatch(videoId);
  }
}