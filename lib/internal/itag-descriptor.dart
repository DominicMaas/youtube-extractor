import 'package:youtube_extractor/models/media-streams/audio-encoding.dart';
import 'package:youtube_extractor/models/media-streams/container.dart';
import 'package:youtube_extractor/models/media-streams/video-encoding.dart';
import 'package:youtube_extractor/models/media-streams/video-quality.dart';

class ItagDescriptor {
  Container container;
  AudioEncoding audioEncoding;
  VideoEncoding videoEncoding;
  VideoQuality videoQuality;

  ItagDescriptor(this.container, this.audioEncoding, this.videoEncoding, this.videoQuality);
}