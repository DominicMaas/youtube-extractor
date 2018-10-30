/// Thrown when the video requires purchase and cannot be processed.
class VideoRequiresPurchaseException implements Exception {
  /// ID of the video.
  String videoId;

  /// ID of a preview video that can be watched for free.
  String previewVideoId;

  VideoRequiresPurchaseException(this.videoId, this.previewVideoId);

  @override
  String toString() =>
      'Video [$videoId] requires purchase and cannot be processed.';
}
