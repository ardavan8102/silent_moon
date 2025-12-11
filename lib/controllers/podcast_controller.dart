import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:silent_moon/models/podcast_model.dart';

class PodcastController extends GetxController {
  final RxBool isLoading = true.obs;

  final List<String> categories = [
    'relaxing',
    'sleeping',
    'happiness',
    'personal',
    'biography',
  ];

  final Map<String, RxList<PodcastModel>> categoryLists = {
    'relaxing': <PodcastModel>[].obs,
    'sleeping': <PodcastModel>[].obs,
    'happiness': <PodcastModel>[].obs,
    'personal': <PodcastModel>[].obs,
    'biography': <PodcastModel>[].obs,
  };
  
  List<PodcastModel> get allPodcasts { return categoryLists.values.expand((list) => list).toList();}

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env['BASE_URL']!,
      headers: {
        'X-ListenAPI-Key': dotenv.env['API_KEY'],
        'Accept': 'application/json',
      },
    ),
  );

  @override
  void onInit() {
    super.onInit();
    loadAllCategories();
  }

  // 🔵 Translate
  Future<String> translateToFa(String text) async {
    try {
      final res = await Dio().get(
        "https://translate.googleapis.com/translate_a/single",
        queryParameters: {
          "client": "gtx",
          "sl": "auto",
          "tl": "fa",
          "dt": "t",
          "dj": "1",
          "q": text,
        },
      );

      final sentences = res.data["sentences"] as List;
      return sentences.map((s) => s["trans"] ?? "").join(" ").trim();
    } catch (e) {
      print("Translate error: $e");
      return text;
    }
  }

  bool isBadTranslation(String faText) {
    final english = RegExp(r'[a-zA-Z]').allMatches(faText).length;
    return english > faText.length * 0.30;
  }

  Future<void> loadCategory(String category) async {
    try {
      final response = await dio.get(
        '/search',
        queryParameters: {
          'q': category,
          'type': 'podcast',
          'offset': 0,
        },
      );

      final List results = response.data['results'];
      final List<PodcastModel> items = [];

      for (var json in results) {
        final model = PodcastModel.fromJson(json);

        if (model.title != null) {
          final translated = await translateToFa(model.title!);

          if (isBadTranslation(translated)) continue;

          model.title = translated;
        }

        items.add(model);
      }

      categoryLists[category]!.assignAll(items);
    } catch (e) {
      print("Error loading '$category': $e");
    }
  }

  Future<void> loadAllCategories() async {
    isLoading.value = true;

    for (var cat in categories) {
      await loadCategory(cat);
    }

    isLoading.value = false;
  }
}
