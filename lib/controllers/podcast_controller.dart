import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:silent_moon/models/podcast_model.dart';

class PodcastController extends GetxController {
  final RxList<PodcastModel> podcastsList = <PodcastModel>[].obs;

  final RxBool isLoading = true.obs;
  final RxBool isRefreshing = false.obs;

  int offset = 0;
  final int limit = 10;

  // Dio instance
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
    loadRelaxingPodcasts();
  }

  // Translate
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
      final translated = sentences.map((s) => s["trans"] ?? "").join(" ").trim();
      return translated;
    } catch (e) {
      print("Translate error: $e");
      return text;
    }
  }

  bool isBadTranslation(String faText) {
    final english = RegExp(r'[a-zA-Z]').allMatches(faText).length;
    return english > faText.length * 0.30;
  }

  Future<void> loadRelaxingPodcasts() async {
    try {
      isLoading.value = true;

      final response = await dio.get(
        '/search',
        queryParameters: {
          'q': 'relaxing',
          'type': 'podcast',
          'offset': offset,
        },
      );

      final List results = response.data['results'];

      final List<PodcastModel> items = [];

      for (var json in results) {
        final model = PodcastModel.fromJson(json);

        if (model.title != null) {
          final translated = await translateToFa(model.title!);

          if (isBadTranslation(translated)) {
            print("❌ حذف شد → ترجمه ناقص: ${model.title}");
            continue;
          }

          model.title = translated;
        }

        items.add(model);
      }

      podcastsList.assignAll(items);
    } catch (e) {
      print('Error loading podcasts: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshData() async {
    try {
      isRefreshing.value = true;
      offset = 0;
      await loadRelaxingPodcasts();
    } finally {
      isRefreshing.value = false;
    }
  }
}