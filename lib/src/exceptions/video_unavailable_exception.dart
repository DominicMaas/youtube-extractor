/// Thrown when video is not available and cannot be processed.
class VideoUnavailableException implements Exception {
  /// ID of the video.
  String videoId;

  /// Error code reported by YouTube.
  int code;

  /// Error reason reported by YouTube.
  String reason;

  VideoUnavailableException(this.videoId, this.code, this.reason);

  @override
  String toString() =>
      'Video [$videoId] is not available and cannot be processed. Code: $code. Reason: $reason.';
}
