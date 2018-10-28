import 'package:youtube_extractor/internal/itag_helper.dart';
import 'package:youtube_extractor/models/media_streams/media_stream_info.dart';
import 'package:youtube_extractor/models/media_streams/video_encoding.dart';
import 'package:youtube_extractor/models/media_streams/video_quality.dart';
import 'package:youtube_extractor/models/media_streams/video_resolution.dart';

/// Metadata associated with a certain [MediaStream] that contains only video.
class VideoStreamInfo extends MediaStreamInfo {
  /// Video bitrate (bits/s) of the associated stream.
  int bitrate;

  /// Video encoding of the associated stream.
  VideoEncoding videoEncoding;

  /// Video quality of the associated stream.
  VideoQuality videoQuality;

  /// Video resolution of the associated stream.
  VideoResolution resolution;

  /// Video framerate (FPS) of the associated stream.
  int framerate;

  VideoStreamInfo(int iTag, String url, int size, this.bitrate, this.resolution, this.framerate) : super(iTag, url, size) {
    videoEncoding = ItagHelper.getVideoEncoding(iTag);
    videoQuality = ItagHelper.getVideoQuality(iTag);
  }
}