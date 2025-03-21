import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_page_controller.dart';

class ElectionResultsCard extends StatelessWidget {
  const ElectionResultsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Obx(() {
      final selectedGovernorate = controller.governorates[controller.currentIndex.value];
      final data = controller.electionData[selectedGovernorate]!;

      return Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              spreadRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Image.asset("assets/images/syria-logo-png_seeklogo-613100 1.png"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.keyboard_arrow_right, color: Colors.green, size: 30),
                  onPressed: () => controller.changeGovernorate(false),
                ),
                Text(
                  selectedGovernorate,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.keyboard_arrow_left, color: Colors.green, size: 30),
                  onPressed: () => controller.changeGovernorate(true),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _infoCard("عدد الأصوات الكلي", "${data['votes']} صوت", Colors.green),
                _infoCard("عدد المرشحين الكلي", "${data['candidates']} مرشح", Colors.green),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "نسبة التصويت في الانتخابات :",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
                ),
                const SizedBox(height: 10),
                _progressBar(data['voters'], data['total'], Colors.green, "المصوتون"),
                _progressBar(data['total'], data['total'], Colors.red, "العدد الكلي"),
              ],
            ),
          ],
        ),
      );
    });
  }

  Widget _infoCard(String title, String value, Color color) {
    return Container(
      width: 140,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color, width: 1.5),
      ),
      child: Column(
        children: [
          Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: color)),
          const SizedBox(height: 5),
          Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _progressBar(int value, int max, Color color, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        LinearProgressIndicator(value: value / max, color: color, backgroundColor: Colors.grey[300]),
        const SizedBox(height: 5),
        Text("$value / $max", style: TextStyle(fontSize: 12, color: Colors.black54)),
      ],
    );
  }
}
