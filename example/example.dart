// This file shows a demostration on how to use the library.
import 'package:youtube_extractor/youtube_extractor.dart';

var extractor = YouTubeExtractor();

main() async {
  // Get and print the audio info for the passed video (music)
  var audioInfo = await extractor.getMediaStreamsAsync('a1ExYqrBJio');
  print('Audio URL: ${audioInfo.audio.first.url}');

  // Get and print the video info for the passed video (ltt)
  var videoInfo = await extractor.getMediaStreamsAsync('j3YQAoN2wGM');
  print('Video URL: ${videoInfo.video.first.url}');

  // Get information for a live YouTube video
  var livestream = await extractor.getMediaStreamsAsync('mSQIX_G3TjU');
  print('Livestream URL: ${livestream.hlsLiveStreamUrl}');
}
