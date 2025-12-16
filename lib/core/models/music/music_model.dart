class MusicModel {
  final int id;
  final String imageUrl;
  final String title;
  final int duration;
  final List<Map<String, dynamic>> audioFilesUrls;
  final List<Map<String, dynamic>> artists;
  final String trackBackgroundColor;

  MusicModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.duration,
    required this.audioFilesUrls,
    required this.artists,
    required this.trackBackgroundColor,
  });

  factory MusicModel.fromJson(Map<String, dynamic> json) {
    return MusicModel(
      id: json['id'],
      imageUrl: json['image'],
      title: json['title'],
      duration: json['duration'],
      audioFilesUrls:
          List<Map<String, dynamic>>.from(json['mp3s']),
      artists:
          List<Map<String, dynamic>>.from(json['artists']),
      trackBackgroundColor: json['background_color'],
    );
  }
}