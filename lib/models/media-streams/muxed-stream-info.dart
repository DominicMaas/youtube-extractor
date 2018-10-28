import 'package:youtube_extractor/internal/itag-helper.dart';
import 'package:youtube_extractor/models/media-streams/audio-encoding.dart';
import 'package:youtube_extractor/models/media-streams/media-stream-info.dart';
import 'package:youtube_extractor/models/media-streams/video-encoding.dart';
import 'package:youtube_extractor/models/media-streams/video-quality.dart';

class MuxedStreamInfo extends MediaStreamInfo {
  /// Audio encoding of the associated stream.
  AudioEncoding audioEncoding;

  /// Video encoding of the associated stream.
  VideoEncoding videoEncoding;

  /// Video quality of the associated stream.
  VideoQuality videoQuality;

  /// Video quality label of the associated stream.
  String videoQualityLabel;

  MuxedStreamInfo(int iTag, String url, BigInt size) : super(iTag, url, size) {
    audioEncoding = ItagHelper.GetAudioEncoding(iTag);
    videoEncoding = ItagHelper.GetVideoEncoding(iTag);
    videoQuality = ItagHelper.GetVideoQuality(iTag);
    videoQualityLabel = videoQuality.toString() + 'p';
  }
}