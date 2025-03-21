import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  var searchText = ''.obs;
  TextEditingController searchController = TextEditingController();

  var days = "4".obs;
  var hours = "12".obs;
  var minutes = "30".obs;
  var seconds = "25".obs;

  final List<String> governorates = ["دمشق", "حلب", "حمص"];
  final Map<String, Map<String, dynamic>> electionData = {
    "دمشق": {"votes": 3000, "candidates": 3000, "voters": 15000, "total": 25550},
    "حلب": {"votes": 4500, "candidates": 3500, "voters": 18000, "total": 27000},
    "حمص": {"votes": 2500, "candidates": 2000, "voters": 12000, "total": 20000},
  };

  var currentIndex = 0.obs;

  void changeGovernorate(bool isNext) {
    if (isNext) {
      currentIndex.value = (currentIndex.value + 1) % governorates.length;
    } else {
      currentIndex.value = (currentIndex.value - 1 + governorates.length) % governorates.length;
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
