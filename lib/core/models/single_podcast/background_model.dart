class PodcastBackgroundModel {

  double a;
  int b;
  int g;
  int r;

  PodcastBackgroundModel({
    required this.a,
    required this.b,
    required this.g,
    required this.r
  });

  factory PodcastBackgroundModel.fromJson(Map<String, dynamic> json){
    return PodcastBackgroundModel(
      a: json['a'],
      b: json['b'],
      g: json['g'],
      r: json['r']
    );
  }

}