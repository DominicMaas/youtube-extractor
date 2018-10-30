import '../../internal/itag_helper.dart';
import 'audio_encoding.dart';
import 'media_stream_info.dart';

/// Metadata associated with a certain [MediaStream] that contains only audio.
class AudioStreamInfo extends MediaStreamInfo {
  /// Bitrate (bit/s) of the associated stream.
  int bitrate;

  /// Audio encoding of the associated stream.
  AudioEncoding audioEncoding;

  AudioStreamInfo(int iTag, String url, int size, this.bitrate)
      : super(iTag, url, size) {
    audioEncoding = ItagHelper.getAudioEncoding(iTag);
  }
}
