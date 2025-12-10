class PodcastModel {

  String? title;
  String? category;
  String? duration;
  String? imagePath;
  bool? isPopular;


  PodcastModel({
    required this.title,
    required this.category,
    required this.duration,
    required this.imagePath,
    required this.isPopular,
  });


  PodcastModel.fromJson(Map<String, dynamic> element) {
    title = element['title'];
    category = element['category'];
    duration = element['duration'];
    imagePath = element['image_path'];
    isPopular = element['is_popular'];
  }

}