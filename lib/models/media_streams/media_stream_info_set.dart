import 'package:youtube_extractor/models/media_streams/audio_stream_info.dart';
import 'package:youtube_extractor/models/media_streams/muxed_stream_info.dart';
import 'package:youtube_extractor/models/media_streams/video_stream_info.dart';

/// Set of all available media stream infos.
class MediaStreamInfoSet {
  /// Muxed streams.
  List<MuxedStreamInfo> muxed;

  /// Audio-only streams.
  List<AudioStreamInfo> audio;

  /// Video-only streams.
  List<VideoStreamInfo> video;

  /// Raw HTTP Live Streaming (HLS) URL to the m3u8 playlist.
  String hlsLiveStreamUrl;

  MediaStreamInfoSet(this.muxed, this.audio, this.video, this.hlsLiveStreamUrl);
}
