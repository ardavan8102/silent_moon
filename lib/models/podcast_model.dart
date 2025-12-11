class PodcastModel {
  String? id;
  String? title;
  String? description;
  String? image;
  String? audio;
  int? audioLengthSec;
  String? publisher;
  String? url;

  PodcastModel({
    this.id,
    this.title,
    this.description,
    this.image,
    this.audio,
    this.audioLengthSec,
    this.publisher,
    this.url,
  });

  PodcastModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title_original'];
    description = json['description_original'];
    image = json['image'];
    audio = json['audio'];
    audioLengthSec = json['audio_length_sec'];
    publisher = json['publisher_original'];
    url = json['listennotes_url'];
  }
}