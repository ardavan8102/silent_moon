import 'package:silent_moon/core/helpers/parse_rss_date.dart';
import 'package:silent_moon/core/models/single_podcast/podcast_episode_model.dart';

extension EpisodeSorting on List<PodcastEpisode> {
  void sortByDateDesc() {
    sort((a, b) {
      final aDate = parseRSSpubDate(a.pubDate);
      final bDate = parseRSSpubDate(b.pubDate);
      if (aDate == null || bDate == null) return 0;
      return bDate.compareTo(aDate);
    });
  }
}