# YouTube Extractor

YouTube Extractor is a library for Dart (and Flutter) that provides an interface to resolve and download YouTube video and audio streams. This library is being primarily developed to provide YouTube support for the mobile SoundByte apps. 

YouTube Extractor is a port of [YouTubeExplode](https://github.com/Tyrrrz/YoutubeExplode) for Dart (minus some extra features that were not needed).

## Features

- Download YouTube audio and video streams.
- Access the YouTube live steaming url.

## Usage

YouTube Extractor has a single entry point, the `YouTubeExtractor` class. See the `example` folder for more information.

### Get a video stream

```dart
var videoStreams = await YouTubeExtractor().getVideoMediaStreamInfosAsync('AtD-HOiAIc4');
var stream = videoStreams.video.first;
print(stream.url);
```