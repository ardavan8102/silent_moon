import 'package:silent_moon/core/models/podcasts/podcast_list_models/podcast_result.dart';

class PodcastData {
  final int perPage;
  final int total;
  final List<PodcastResponseResult> result;

  PodcastData({
    required this.perPage,
    required this.total,
    required this.result,
  });

  factory PodcastData.fromJson(Map<String, dynamic> json) {
    return PodcastData(
      perPage: json['per_page'],
      total: json['total'],
      result: (json['result'] as List)
          .map((e) => PodcastResponseResult.fromJson(e))
          .toList(),
    );
  }
}
