import 'package:youtube_extractor/models/media-streams/audio-stream-info.dart';
import 'package:youtube_extractor/models/media-streams/muxed-stream-info.dart';
import 'package:youtube_extractor/models/media-streams/video-stream-info.dart';

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