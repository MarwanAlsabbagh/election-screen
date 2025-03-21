import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartiesController extends GetxController {
  final RxList<Map<String, dynamic>> parties = <Map<String, dynamic>>[
    {
      "name": "حزب العمال الديمقراطي",
      "governorate": "دمشق",
      "imagePath": "assets/Logo.png",
      "numbermembers": 120,
    },
    {
      "name": "حزب الاستقلال الوطني",
      "governorate": "حلب",
      "imagePath": "assets/Logo.png",
      "numbermembers": 95,
    },
    {
      "name": "حزب الوحدة الوطنية",
      "governorate": "حمص",
      "imagePath": "assets/Logo.png",
      "numbermembers": 80,
    },
  ].obs;

  RxList<Map<String, dynamic>> filteredParties = <Map<String, dynamic>>[].obs;

  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    filteredParties.assignAll(parties);

    searchController.addListener(() {
      filterParties(searchController.text);
    });
  }

  void filterParties(String query) {
    if (query.isEmpty) {
      filteredParties.assignAll(parties);
    } else {
      filteredParties.assignAll(
        parties.where((party) => party["name"]!.contains(query)).toList(),
      );
    }
  }
}
