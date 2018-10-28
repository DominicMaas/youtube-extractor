import 'package:youtube_extractor/models/media-streams/audio-encoding.dart';
import 'package:youtube_extractor/models/media-streams/media-stream-info.dart';

/// Metadata associated with a certain [MediaStream] that contains only audio.
class AudioStreamInfo extends MediaStreamInfo {
  /// Bitrate (bit/s) of the associated stream.
  BigInt bitrate;

  /// Audio encoding of the associated stream.
  AudioEncoding audioEncoding; 

  AudioStreamInfo(int iTag, String url, BigInt size, this.audioEncoding) : super(iTag, url, size) {
    audioEncoding = ItagHelper.GetAudioEncoding(iTag);
  }
}