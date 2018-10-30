// This file shows a demostration on how to use the library.
import 'package:youtube_extractor/youtube_extractor.dart';

main() async {
  // Get the stream info for the passed video
  var streamInfo = await YouTubeExtractor().getVideoMediaStreamInfosAsync('a1ExYqrBJio');
  
  // Print the audio stream url
  print('Audio URL: ${streamInfo.audio.first.url}');
}