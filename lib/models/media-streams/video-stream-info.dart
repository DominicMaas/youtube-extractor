import 'package:youtube_extractor/models/media-streams/media-stream-info.dart';
import 'package:youtube_extractor/models/media-streams/video-encoding.dart';
import 'package:youtube_extractor/models/media-streams/video-quality.dart';
import 'package:youtube_extractor/models/media-streams/video-resolution.dart';

/// Metadata associated with a certain [MediaStream] that contains only video.
class VideoStreamInfo extends MediaStreamInfo {
  /// Video bitrate (bits/s) of the associated stream.
  BigInt bitrate;

  /// Video encoding of the associated stream.
  VideoEncoding videoEncoding;

  /// Video quality of the associated stream.
  VideoQuality videoQuality;

  /// Video resolution of the associated stream.
  VideoResolution resolution;

  /// Video framerate (FPS) of the associated stream.
  int framerate;

  /// Video quality label of the associated stream.
  String videoQualityLabel;

  VideoStreamInfo(int iTag, String url, BigInt size, this.bitrate, this.resolution, this.framerate, this.videoQualityLabel) : super(iTag, url, size);
}