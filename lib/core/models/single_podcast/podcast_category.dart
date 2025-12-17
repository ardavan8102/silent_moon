class PodcastCategory {

  final int? id;
  final String? title;
  final String? slug;

  PodcastCategory({
    required this.id,
    required this.title,
    required this.slug,
  });


  factory PodcastCategory.fromJson(Map<String, dynamic> json){

    return PodcastCategory(
      id: json['id'] ?? 1,
      title: json['title'] ?? '',
      slug: json['slug'] ?? '',
    );

  }

}