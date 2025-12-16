import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:silent_moon/core/models/music/music_model.dart';

class MusicAlbumController extends GetxController {

  final RxList<MusicModel> musics = <MusicModel>[].obs;

  final RxBool isLoading = false.obs;

  final RxString errorMessage = ''.obs;


  @override
  void onInit() {
    super.onInit();
    loadFromLocalJson();
  }


  Future<void> loadFromLocalJson() async {

    try {

      isLoading.value = true;
      errorMessage.value = '';

      // read json
      final jsonString = await rootBundle.loadString('assets/json/musics.json');

      // decode
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);

      // fetch musics list
      final List tracks = jsonData['result']['tracks'];

      // convert to model
      final parsedMusics = tracks.map((data) => MusicModel.fromJson(data)).toList();

      musics.assignAll(parsedMusics);

    } catch (e) {

      errorMessage.value = e.toString();

    } finally {

      isLoading.value = false;

    }

  }

  Future<void> refreshMusics() async {
    await loadFromLocalJson();
  }

}