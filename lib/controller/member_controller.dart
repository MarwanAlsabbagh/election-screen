import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MembersController extends GetxController {
  final RxList<Map<String, String?>> members = <Map<String, String?>>[
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
    {
      "name": "سعيد منصور",
      "imagePath": "assets/images/Rectangle 35.png",
    },
  ].obs;

  RxList<Map<String, String?>> filteredMembers = <Map<String, String?>>[].obs;

  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    filteredMembers.assignAll(members);

    searchController.addListener(() {
      filterMembers(searchController.text);
    });
  }

  void filterMembers(String query) {
    if (query.isEmpty) {
      filteredMembers.assignAll(members);
    } else {
      filteredMembers.assignAll(
        members.where((member) => member["name"]!.contains(query)).toList(),
      );
    }
  }
}
