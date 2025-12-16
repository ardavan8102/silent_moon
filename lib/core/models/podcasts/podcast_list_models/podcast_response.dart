import 'package:silent_moon/core/models/podcasts/podcast_list_models/podcast_data.dart';

class PodcastResponse {
  final PodcastData data;
  final String error;
  final String message;
  final String representedAt;
  final String version;

  PodcastResponse({
    required this.data,
    required this.error,
    required this.message,
    required this.representedAt,
    required this.version,
  });

  factory PodcastResponse.fromJson(Map<String, dynamic> json) {
    return PodcastResponse(
      data: PodcastData.fromJson(json['data']),
      error: json['error'] ?? '',
      message: json['message'] ?? '',
      representedAt: json['represented_at'] ?? '',
      version: json['version'] ?? '',
    );
  }
}
