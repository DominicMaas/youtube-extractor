import 'package:http/http.dart' as http;
import 'package:youtube_extractor/exceptions/parse_exception.dart';
import 'package:youtube_extractor/exceptions/video_requires_purchase_exception.dart';
import 'package:youtube_extractor/exceptions/video_unavailable_exception.dart';
import 'package:youtube_extractor/internal/parsers/video_info_parser.dart';
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
      throw ParseException("Could not parse player context.");

    return PlayerContext(playerSourceUrl, sts);
  }
  
  Future<VideoInfoParser> _getVideoInfoParserAsync(String videoId, String el, String sts) async {

    // This parameter does magic and a lot of videos don't work without it
    var eurl = Uri.encodeFull('https://youtube.googleapis.com/v/$videoId');
    
    // Build the url and perform a request
    var url = "https://www.youtube.com/get_video_info?video_id=$videoId&el=$el&sts=$sts&eurl=$eurl&hl=en";  
    var body = (await http.get(url)).body;

    var parser = VideoInfoParser.initialize(body);

    var root = Uri.splitQueryString(body);;

    // Check if video exists by verifying that video ID property is not empty
    if (root['video_id'] == null || root['video_id'].isEmpty) {
      // Get native error code and error reason
      var errorCode = root['errorcode'] as int;
      var errorReason = root['reason'];

      throw new VideoUnavailableException(videoId, errorCode, errorReason);
    }
    
    // If requested with "sts" parameter, it means that the calling code is interested in getting video info with streams.
    // For that we also need to make sure the video is fully available by checking for errors.
    if (sts != null && sts.isNotEmpty && root['errorcode'] != null && root['errorcode'] as int != 0) {

    }
   
    // Return the split string
    return parser;
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
    var parser = await _getVideoInfoParserAsync(videoId, "embedded", playerContext.sts);

    // Check if video requires purchase
    var previewVideoId = parser.parsePreviewVideoId();
    if (previewVideoId != null) {
      throw new VideoRequiresPurchaseException(videoId, previewVideoId);
    }
    
    // Prepare stream info maps
    var muxedStreamInfoMap = new Map<int, MuxedStreamInfo>();
    var audioStreamInfoMap = new Map<int, AudioStreamInfo>();
    var videoStreamInfoMap = new Map<int, VideoStreamInfo>();

    // Parse muxed stream infos   
    parser.getMuxedStreamInfos().forEach((muxedStreamInfoParser) {

    });

    // Parse adaptive stream infos
    parser.getMuxedStreamInfos().forEach((muxedStreamInfoParser) {

    });

    // Parse dash manifest
    parser.getMuxedStreamInfos().forEach((muxedStreamInfoParser) {

    });

    // Get the raw HLS stream playlist (*.m3u8)
    var hlsPlaylistUrl = parser.parseHlsPlaylistUrl();
  
    // Finalize stream info collections
    var muxedStreamInfos = muxedStreamInfoMap.values.toList(); 
    var audioStreamInfos = audioStreamInfoMap.values.toList();
    var videoStreamInfos = videoStreamInfoMap.values.toList();

    return MediaStreamInfoSet(muxedStreamInfos, audioStreamInfos, videoStreamInfos, hlsPlaylistUrl);
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