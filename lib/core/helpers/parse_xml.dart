import 'package:silent_moon/core/models/single_podcast/podcast_episode_model.dart';
import 'package:xml/xml.dart';

List<PodcastEpisode> parsePodcastEpisodes(String xmlString) {
  final document = XmlDocument.parse(xmlString);

  final items = document.findAllElements('item');

  return items.map((item) {
    
    final title = item.getElement('title')?.innerText.trim() ?? '';

    final description = item.getElement('description')?.innerText.trim() ?? '';

    final pubDate = item.getElement('pubDate')?.innerText ?? '';

    final enclosure = item.getElement('enclosure');

    final audioUrl = enclosure?.getAttribute('url') ?? '';

    final duration = item.getElement('itunes:duration')?.innerText ?? '';

    return PodcastEpisode(
      title: title,
      description: description,
      audioUrl: audioUrl,
      pubDate: pubDate,
      duration: duration,
    );
  }).toList();
}
