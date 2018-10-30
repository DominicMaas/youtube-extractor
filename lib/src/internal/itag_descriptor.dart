import '../models/media_streams/audio_encoding.dart';
import '../models/media_streams/container.dart';
import '../models/media_streams/video_encoding.dart';
import '../models/media_streams/video_quality.dart';

class ItagDescriptor {
  Container container;
  AudioEncoding audioEncoding;
  VideoEncoding videoEncoding;
  VideoQuality videoQuality;

  ItagDescriptor(this.container, this.audioEncoding, this.videoEncoding,
      this.videoQuality);
}
