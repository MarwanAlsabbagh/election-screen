import 'package:get/get.dart';

class PartyController extends GetxController {
  var selectedButton = 'حول الحزب'.obs;

  var videoUrls = [
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"
  ].obs;

  var articles = [
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

  var members = [
    {
      "name": "يوسف بيرقدار",
      "governorate": "دمشق",
      "category": "أ",
      "party": "حزب العمال الديمقراطي",
      "imagePath": "assets/images/Rectangle 35.png",
      "partyLogoPath": "assets/icons/Logo.png",
    },
    {
      "name": "أحمد العلي",
      "governorate": "حلب",
      "category": "ب",
      "party": "حزب الاستقلال الوطني",
      "imagePath": "assets/images/Rectangle 35.png",
      "partyLogoPath": "assets/icons/Logo.png",
    },
  ].obs;

  void changeSelectedButton(String button) {
    selectedButton.value = button;
  }
}
