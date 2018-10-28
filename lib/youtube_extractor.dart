import 'package:http/http.dart' as http;
import 'package:youtube_extractor/internal/player_context.dart';
import 'package:youtube_extractor/models/media_streams/audio_stream_info.dart';
import 'package:youtube_extractor/models/media_streams/media_stream_info_set.dart';
import 'package:youtube_extractor/models/media_streams/muxed_stream_info.dart';
import 'package:youtube_extractor/models/media_streams/video_stream_info.dart';
import 'dart:convert';

/// Dart port of YouTubeExplode
class YouTubeExtractor {
  
  Future<PlayerContext> _getVideoPlayerContextAsync(String videoId) async {
    // Build the required url and get the response
    var url = 'https://www.youtube.com/embed/$videoId?disable_polymer=true&hl=en';
    var body = (await http.get(url)).body;
    
    // Extract the config part
    var config = RegExp(r"yt\.setConfig\({'PLAYER_CONFIG':.+?\}\);", multiLine: true).firstMatch(body).group(0);

    // Trip off the start and end to get a valid JSON string
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
  
  Future<Map<String, String>> _getVideoInfoAsync(String videoId, String el, String sts) async {

    // This parameter does magic and a lot of videos don't work without it
    var eurl = Uri.encodeFull('https://youtube.googleapis.com/v/$videoId');
    
    // Build the url and perform a request
    var url = "https://www.youtube.com/get_video_info?video_id=$videoId&el=$el&sts=$sts&eurl=$eurl&hl=en";  
    var body = (await http.get(url)).body;

    // TODO: Error Checking

    // Return the split string
    return Uri.splitQueryString(body);
  }

  /// Gets a set of all available media stream infos for given video.
  Future<MediaStreamInfoSet> getVideoMediaStreamInfosAsync(String videoId) async {
    
    // Make sure the ID is valid
    if (!validateVideoId(videoId)) {
      throw ArgumentError('Invalid YouTube video ID [$videoId].');
    }

    // Get player context
    var playerContext = await _getVideoPlayerContextAsync(videoId);

    // Get parser
    var videoInfo = await _getVideoInfoAsync(videoId, "embedded", playerContext.sts);

    // TODO: Check if requires purchase

    // Prepare stream info maps
    var muxedStreamInfoMap = new Map<int, MuxedStreamInfo>();
    var audioStreamInfoMap = new Map<int, AudioStreamInfo>();
    var videoStreamInfoMap = new Map<int, VideoStreamInfo>();

    // Parse muxed stream infos    
    var streamInfosEncoded = videoInfo['url_encoded_fmt_stream_map'];



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