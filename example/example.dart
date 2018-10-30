// This file shows a demostration on how to use the library.
import 'package:youtube_extractor/youtube_extractor.dart';

var extractor = YouTubeExtractor();

main() async {
  // Get the stream info for the passed video
  var streamInfo = await extractor.getMediaStreamsAsync('a1ExYqrBJio');

  // Print the audio stream url
  print('Audio URL: ${streamInfo.audio.first.url}');

  var streamInfo2 = await extractor.getMediaStreamsAsync('j3YQAoN2wGM');
  print('Audio URL: ${streamInfo2.video.first.url}');

 
}