import '../internal/itag_descriptor.dart';
import '../models/media_streams/container.dart';
import '../models/media_streams/audio_encoding.dart';
import '../models/media_streams/video_encoding.dart';
import '../models/media_streams/video_quality.dart';

class ItagHelper {
  static Map<int, ItagDescriptor> _ItagMap = {
    // Muxed
    5: ItagDescriptor(Container.Flv, AudioEncoding.Mp3, VideoEncoding.H263,
        VideoQuality.Low144),
    6: ItagDescriptor(Container.Flv, AudioEncoding.Mp3, VideoEncoding.H263,
        VideoQuality.Low240),
    13: ItagDescriptor(Container.Tgpp, AudioEncoding.Aac, VideoEncoding.Mp4V,
        VideoQuality.Low144),
    17: ItagDescriptor(Container.Tgpp, AudioEncoding.Aac, VideoEncoding.Mp4V,
        VideoQuality.Low144),
    18: ItagDescriptor(Container.Mp4, AudioEncoding.Aac, VideoEncoding.H264,
        VideoQuality.Medium360),
    22: ItagDescriptor(Container.Mp4, AudioEncoding.Aac, VideoEncoding.H264,
        VideoQuality.High720),
    34: ItagDescriptor(Container.Flv, AudioEncoding.Aac, VideoEncoding.H264,
        VideoQuality.Medium360),
    35: ItagDescriptor(Container.Flv, AudioEncoding.Aac, VideoEncoding.H264,
        VideoQuality.Medium480),
    36: ItagDescriptor(Container.Tgpp, AudioEncoding.Aac, VideoEncoding.Mp4V,
        VideoQuality.Low240),
    37: ItagDescriptor(Container.Mp4, AudioEncoding.Aac, VideoEncoding.H264,
        VideoQuality.High1080),
    38: ItagDescriptor(Container.Mp4, AudioEncoding.Aac, VideoEncoding.H264,
        VideoQuality.High3072),
    43: ItagDescriptor(Container.WebM, AudioEncoding.Vorbis, VideoEncoding.Vp8,
        VideoQuality.Medium360),
    44: ItagDescriptor(Container.WebM, AudioEncoding.Vorbis, VideoEncoding.Vp8,
        VideoQuality.Medium480),
    45: ItagDescriptor(Container.WebM, AudioEncoding.Vorbis, VideoEncoding.Vp8,
        VideoQuality.High720),
    46: ItagDescriptor(Container.WebM, AudioEncoding.Vorbis, VideoEncoding.Vp8,
        VideoQuality.High1080),
    59: ItagDescriptor(Container.Mp4, AudioEncoding.Aac, VideoEncoding.H264,
        VideoQuality.Medium480),
    78: ItagDescriptor(Container.Mp4, AudioEncoding.Aac, VideoEncoding.H264,
        VideoQuality.Medium480),
    82: ItagDescriptor(Container.Mp4, AudioEncoding.Aac, VideoEncoding.H264,
        VideoQuality.Medium360),
    83: ItagDescriptor(Container.Mp4, AudioEncoding.Aac, VideoEncoding.H264,
        VideoQuality.Medium480),
    84: ItagDescriptor(Container.Mp4, AudioEncoding.Aac, VideoEncoding.H264,
        VideoQuality.High720),
    85: ItagDescriptor(Container.Mp4, AudioEncoding.Aac, VideoEncoding.H264,
        VideoQuality.High1080),
    91: ItagDescriptor(Container.Mp4, AudioEncoding.Aac, VideoEncoding.H264,
        VideoQuality.Low144),
    92: ItagDescriptor(Container.Mp4, AudioEncoding.Aac, VideoEncoding.H264,
        VideoQuality.Low240),
    93: ItagDescriptor(Container.Mp4, AudioEncoding.Aac, VideoEncoding.H264,
        VideoQuality.Medium360),
    94: ItagDescriptor(Container.Mp4, AudioEncoding.Aac, VideoEncoding.H264,
        VideoQuality.Medium480),
    95: ItagDescriptor(Container.Mp4, AudioEncoding.Aac, VideoEncoding.H264,
        VideoQuality.High720),
    96: ItagDescriptor(Container.Mp4, AudioEncoding.Aac, VideoEncoding.H264,
        VideoQuality.High1080),
    100: ItagDescriptor(Container.WebM, AudioEncoding.Vorbis, VideoEncoding.Vp8,
        VideoQuality.Medium360),
    101: ItagDescriptor(Container.WebM, AudioEncoding.Vorbis, VideoEncoding.Vp8,
        VideoQuality.Medium480),
    102: ItagDescriptor(Container.WebM, AudioEncoding.Vorbis, VideoEncoding.Vp8,
        VideoQuality.High720),
    132: ItagDescriptor(Container.Mp4, AudioEncoding.Aac, VideoEncoding.H264,
        VideoQuality.Low240),
    151: ItagDescriptor(Container.Mp4, AudioEncoding.Aac, VideoEncoding.H264,
        VideoQuality.Low144),

    // Video-only (mp4)
    133: ItagDescriptor(
        Container.Mp4, null, VideoEncoding.H264, VideoQuality.Low240),
    134: ItagDescriptor(
        Container.Mp4, null, VideoEncoding.H264, VideoQuality.Medium360),
    135: ItagDescriptor(
        Container.Mp4, null, VideoEncoding.H264, VideoQuality.Medium480),
    136: ItagDescriptor(
        Container.Mp4, null, VideoEncoding.H264, VideoQuality.High720),
    137: ItagDescriptor(
        Container.Mp4, null, VideoEncoding.H264, VideoQuality.High1080),
    138: ItagDescriptor(
        Container.Mp4, null, VideoEncoding.H264, VideoQuality.High4320),
    160: ItagDescriptor(
        Container.Mp4, null, VideoEncoding.H264, VideoQuality.Low144),
    212: ItagDescriptor(
        Container.Mp4, null, VideoEncoding.H264, VideoQuality.Medium480),
    213: ItagDescriptor(
        Container.Mp4, null, VideoEncoding.H264, VideoQuality.Medium480),
    214: ItagDescriptor(
        Container.Mp4, null, VideoEncoding.H264, VideoQuality.High720),
    215: ItagDescriptor(
        Container.Mp4, null, VideoEncoding.H264, VideoQuality.High720),
    216: ItagDescriptor(
        Container.Mp4, null, VideoEncoding.H264, VideoQuality.High1080),
    217: ItagDescriptor(
        Container.Mp4, null, VideoEncoding.H264, VideoQuality.High1080),
    264: ItagDescriptor(
        Container.Mp4, null, VideoEncoding.H264, VideoQuality.High1440),
    266: ItagDescriptor(
        Container.Mp4, null, VideoEncoding.H264, VideoQuality.High2160),
    298: ItagDescriptor(
        Container.Mp4, null, VideoEncoding.H264, VideoQuality.High720),
    299: ItagDescriptor(
        Container.Mp4, null, VideoEncoding.H264, VideoQuality.High1080),
    399: ItagDescriptor(
        Container.Mp4, null, VideoEncoding.Av1, VideoQuality.High1080),
    398: ItagDescriptor(
        Container.Mp4, null, VideoEncoding.Av1, VideoQuality.High720),
    397: ItagDescriptor(
        Container.Mp4, null, VideoEncoding.Av1, VideoQuality.Medium480),
    396: ItagDescriptor(
        Container.Mp4, null, VideoEncoding.Av1, VideoQuality.Medium360),
    395: ItagDescriptor(
        Container.Mp4, null, VideoEncoding.Av1, VideoQuality.Low240),
    394: ItagDescriptor(
        Container.Mp4, null, VideoEncoding.Av1, VideoQuality.Low144),

    // Video-only (webm)
    167: ItagDescriptor(
        Container.WebM, null, VideoEncoding.Vp8, VideoQuality.Medium360),
    168: ItagDescriptor(
        Container.WebM, null, VideoEncoding.Vp8, VideoQuality.Medium480),
    169: ItagDescriptor(
        Container.WebM, null, VideoEncoding.Vp8, VideoQuality.High720),
    170: ItagDescriptor(
        Container.WebM, null, VideoEncoding.Vp8, VideoQuality.High1080),
    218: ItagDescriptor(
        Container.WebM, null, VideoEncoding.Vp8, VideoQuality.Medium480),
    219: ItagDescriptor(
        Container.WebM, null, VideoEncoding.Vp8, VideoQuality.Medium480),
    242: ItagDescriptor(
        Container.WebM, null, VideoEncoding.Vp9, VideoQuality.Low240),
    243: ItagDescriptor(
        Container.WebM, null, VideoEncoding.Vp9, VideoQuality.Medium360),
    244: ItagDescriptor(
        Container.WebM, null, VideoEncoding.Vp9, VideoQuality.Medium480),
    245: ItagDescriptor(
        Container.WebM, null, VideoEncoding.Vp9, VideoQuality.Medium480),
    246: ItagDescriptor(
        Container.WebM, null, VideoEncoding.Vp9, VideoQuality.Medium480),
    247: ItagDescriptor(
        Container.WebM, null, VideoEncoding.Vp9, VideoQuality.High720),
    248: ItagDescriptor(
        Container.WebM, null, VideoEncoding.Vp9, VideoQuality.High1080),
    271: ItagDescriptor(
        Container.WebM, null, VideoEncoding.Vp9, VideoQuality.High1440),
    272: ItagDescriptor(
        Container.WebM, null, VideoEncoding.Vp9, VideoQuality.High2160),
    278: ItagDescriptor(
        Container.WebM, null, VideoEncoding.Vp9, VideoQuality.Low144),
    302: ItagDescriptor(
        Container.WebM, null, VideoEncoding.Vp9, VideoQuality.High720),
    303: ItagDescriptor(
        Container.WebM, null, VideoEncoding.Vp9, VideoQuality.High1080),
    308: ItagDescriptor(
        Container.WebM, null, VideoEncoding.Vp9, VideoQuality.High1440),
    313: ItagDescriptor(
        Container.WebM, null, VideoEncoding.Vp9, VideoQuality.High2160),
    315: ItagDescriptor(
        Container.WebM, null, VideoEncoding.Vp9, VideoQuality.High2160),
    330: ItagDescriptor(
        Container.WebM, null, VideoEncoding.Vp9, VideoQuality.Low144),
    331: ItagDescriptor(
        Container.WebM, null, VideoEncoding.Vp9, VideoQuality.Low240),
    332: ItagDescriptor(
        Container.WebM, null, VideoEncoding.Vp9, VideoQuality.Medium360),
    333: ItagDescriptor(
        Container.WebM, null, VideoEncoding.Vp9, VideoQuality.Medium480),
    334: ItagDescriptor(
        Container.WebM, null, VideoEncoding.Vp9, VideoQuality.High720),
    335: ItagDescriptor(
        Container.WebM, null, VideoEncoding.Vp9, VideoQuality.High1080),
    336: ItagDescriptor(
        Container.WebM, null, VideoEncoding.Vp9, VideoQuality.High1440),
    337: ItagDescriptor(
        Container.WebM, null, VideoEncoding.Vp9, VideoQuality.High2160),

    // Audio-only (mp4)
    139: ItagDescriptor(Container.M4A, AudioEncoding.Aac, null, null),
    140: ItagDescriptor(Container.M4A, AudioEncoding.Aac, null, null),
    141: ItagDescriptor(Container.M4A, AudioEncoding.Aac, null, null),
    256: ItagDescriptor(Container.M4A, AudioEncoding.Aac, null, null),
    258: ItagDescriptor(Container.M4A, AudioEncoding.Aac, null, null),
    325: ItagDescriptor(Container.M4A, AudioEncoding.Aac, null, null),
    328: ItagDescriptor(Container.M4A, AudioEncoding.Aac, null, null),

    // Audio-only (webm)
    171: ItagDescriptor(Container.WebM, AudioEncoding.Vorbis, null, null),
    172: ItagDescriptor(Container.WebM, AudioEncoding.Vorbis, null, null),
    249: ItagDescriptor(Container.WebM, AudioEncoding.Opus, null, null),
    250: ItagDescriptor(Container.WebM, AudioEncoding.Opus, null, null),
    251: ItagDescriptor(Container.WebM, AudioEncoding.Opus, null, null)
  };

  static Container getContainer(int itag) {
    var result = _ItagMap[itag]?.container;

    if (result == null) {
      throw new ArgumentError('Unexpected itag [$itag].');
    }

    return result;
  }

  static AudioEncoding getAudioEncoding(int itag) {
    var result = _ItagMap[itag]?.audioEncoding;

    if (result == null) {
      throw new ArgumentError('Unexpected itag [$itag].');
    }

    return result;
  }

  static VideoEncoding getVideoEncoding(int itag) {
    var result = _ItagMap[itag]?.videoEncoding;

    if (result == null) {
      throw new ArgumentError('Unexpected itag [$itag].');
    }

    return result;
  }

  static VideoQuality getVideoQuality(int itag) {
    var result = _ItagMap[itag]?.videoQuality;

    if (result == null) {
      throw new ArgumentError('Unexpected itag [$itag].');
    }

    return result;
  }

  static bool isKnown(int itag) {
    return _ItagMap.containsKey(itag);
  }
}
