// This file shows a demostration on how to use the library.
import 'package:youtube_extractor/youtube_extractor.dart';

var extractor = YouTubeExtractor();

main() async {
  // Get and print the audio info for the passed video (music video)
  var musicVideoInfo = await extractor.getMediaStreamsAsync('52nfjRzIaj8');
  print('Music Video Audio URL: ${musicVideoInfo.audio.first.url}');

  // Get and print the audio info for the passed video (music)
  var audioInfo = await extractor.getMediaStreamsAsync('a1ExYqrBJio');
  print('Audio URL: ${audioInfo.audio.first.url}');

  // Get and print the video info for the passed video (ltt)
  var videoInfo = await extractor.getMediaStreamsAsync('j3YQAoN2wGM');
  print('Video URL: ${videoInfo.video.first.url}');

  // Get information for a live YouTube video
  // 'mSQIX_G3TjU' Live video is currently not available
  // var livestream = await extractor.getMediaStreamsAsync('mSQIX_G3TjU');
  // print('Livestream URL: ${livestream.hlsLiveStreamUrl}');

  // Another test
  var previousBrokenStream = await extractor.getMediaStreamsAsync('m7Bc3pLyij0');
  print('Previous Broken Stream URL: ${previousBrokenStream.audio.first.url}');

  var previousBrokenStream2 = await extractor.getMediaStreamsAsync('Soa3gO7tL-c');
  print('Previous Broken Stream 2 URL: ${previousBrokenStream2.audio.first.url}');

  var previousBrokenStream3 = await extractor.getMediaStreamsAsync('YQHsXMglC9A');
  print('Previous Broken Stream 3 URL: ${previousBrokenStream3.audio.first.url}');
}
