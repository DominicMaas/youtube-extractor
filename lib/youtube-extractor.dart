import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:youtube_extractor/models/player-context.dart';

/// Dart port of YouTubeExplode
class YouTubeExtractor {
  
  Future<PlayerContext> _getVideoPlayerContextAsync(String videoId) async {
    // Build the required url and get the response
    var url = 'https://www.youtube.com/embed/$videoId?disable_polymer=true&hl=en';
    var body = (await http.get(url)).body;
    
    // Extract the config part
    var config = RegExp(r"yt\.setConfig\({'PLAYER_CONFIG':.+?\}\);", multiLine: true).firstMatch(body).group(0);
    config = config.substring(30, config.length - 3);

    // Decode the json
    var root = json.decode(config);
    
    // Get the player source url
    var playerSourceUrl = root["assets"]["js"].toString();
    if (playerSourceUrl != null && playerSourceUrl.isNotEmpty) {
      playerSourceUrl = "https://www.youtube.com" + playerSourceUrl;
    }

    // Get the sts
    var sts = root["sts"].toString();    

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

    // Get parser

    print(playerContext.sts);
    print(playerContext.sourceUrl);
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