import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CandidatesController extends GetxController {
  RxList<String> videoUrls = [
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"
  ].obs;

  RxList<Map<String, String>> articles = [
    {
      "image": "assets/images/Rectangle 37.png",
      "title": "العدالة الانتقالية للسلطة",
      "date": "15/2/2024"
    },
    {
      "image": "assets/images/Rectangle 37.png",
      "title": "الإصلاحات السياسية المستقبلية",
      "date": "20/3/2024"
    },
    {
      "image": "assets/images/Rectangle 37.png",
      "title": "التحديات الاقتصادية والحلول",
      "date": "10/4/2024"
    }
  ].obs;

  RxString selectedButton = 'حول المرشح'.obs;

  TextEditingController searchController = TextEditingController();
}
