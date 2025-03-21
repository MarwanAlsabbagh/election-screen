import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/home_page_controller.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/election_countdown.dart';
import '../widgets/election_result.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: controller.searchController,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      hintText: "ابحث عن ما تريد...",
                      prefixIcon: Icon(Icons.search, color: Colors.green),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) => controller.searchText.value = value,
                  ),
                ),
                SizedBox(height: 20),
                Obx(() => ElectionCountdown(
                  days: controller.days.value,
                  hours: controller.hours.value,
                  minutes: controller.minutes.value,
                  seconds: controller.seconds.value,
                )),
                SizedBox(height:10),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text("نتائج الانتخابات الحالية :",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2E8F5A),
                    ),),
                ),
                 ElectionResultsCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
