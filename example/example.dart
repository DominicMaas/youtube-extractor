// This file shows a demostration on how to use the library.

import '../lib/youtube_extractor.dart';

main() async {
  var videoStreams = await YouTubeExtractor().getVideoMediaStreamInfosAsync('a1ExYqrBJio');
  
  var i = 0;

  var videoStream2 = await YouTubeExtractor().getVideoMediaStreamInfosAsync('o91BjYjTVRg');

  var j = 0;
}