class PodcastAction {
  final String type;
  final String url;
  final String webUrl;
  final int channelId;

  PodcastAction({
    required this.type,
    required this.url,
    required this.webUrl,
    required this.channelId,
  });

  factory PodcastAction.fromJson(Map<String, dynamic> json) {
    final inputs = json['inputs'] as List;

    return PodcastAction(
      type: json['type'],
      url: json['url'],
      webUrl: json['web_url'],
      channelId: inputs.firstWhere(
        (e) => e['key'] == 'channelId',
      )['value'],
    );
  }
}