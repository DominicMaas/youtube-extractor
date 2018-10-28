// This file shows a demostration on how to use the library.

import '../lib/youtube-extractor.dart';

main() async {
  var videoInfos = await YouTubeExtractor().getVideoMediaStreamInfosAsync('AtD-HOiAIc4');

}