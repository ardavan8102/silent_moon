class PodcastEpisode {
  final String id;
  final String title;
  final String description;
  final String audioUrl;
  final Duration? duration;

  PodcastEpisode({
    required this.id,
    required this.title,
    required this.description,
    required this.audioUrl,
    this.duration,
  });
}