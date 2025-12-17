import 'package:silent_moon/core/helpers/parse_duration.dart';
import 'package:xml/xml.dart';
import 'package:silent_moon/core/models/single_podcast/podcast_episode_model.dart';

List<PodcastEpisode> parsePodcastEpisodes(
  String xmlString, {
  required String podcastFallbackImage,
}) {
  final document = XmlDocument.parse(xmlString);
  final items = document.findAllElements('item');

  return items.map((item) {

    final title =
        item.getElement('title')?.innerText.trim() ?? '';


    final description =
        item.getElement('description')?.innerText.trim() ?? '';


    final enclosure = item.getElement('enclosure');
    final audioUrl = enclosure?.getAttribute('url') ?? '';


    final id = item.getElement('guid')?.innerText.trim().isNotEmpty == true
        ? item.getElement('guid')!.innerText.trim()
        : audioUrl;


    final durationString =
        item.getElement('itunes:duration')?.innerText.trim();

    final duration = parseDuration(durationString);

    return PodcastEpisode(
      id: id,
      title: title,
      description: description,
      audioUrl: audioUrl,
      duration: duration,
    );
  }).toList();
}