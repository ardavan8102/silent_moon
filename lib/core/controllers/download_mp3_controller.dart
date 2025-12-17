import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class DownloadMp3Controller extends GetxController {

  final Dio _dio = Dio();

  final RxDouble progress = 0.0.obs;
  final RxBool isDownloading = false.obs;


  Future<void> downloadAudio({
    required String url,
    required String fileName,
  }) async {

    try {

      isDownloading.value = true;

      progress.value = 0;

      final dir = await getApplicationDocumentsDirectory();

      final savePath = '${dir.path}/$fileName.mp3';

      await _dio.download(
        url,
        savePath,
        onReceiveProgress: (count, total) {
          if (total != -1) {
            progress.value = count / total;
          }
        },
      );

      Get.snackbar(
        'دانلود شد ✅',
        'فایل با موفقیت در دستگاه شما ذخیره شد',
        colorText: Colors.white,
      );

    } catch (e) {
      
      Get.snackbar('خطا ❌', 'خطا در دانلود : $e');

    } finally {

      isDownloading.value = false;

    }

  }

}