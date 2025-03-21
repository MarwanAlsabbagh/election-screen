import 'package:flutter/material.dart';

class ElectionCountdown extends StatelessWidget {
  final String days;
  final String hours;
  final String minutes;
  final String seconds;

  const ElectionCountdown({
    super.key,
    required this.days,
    required this.hours,
    required this.minutes,
    required this.seconds,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffF7F7F8),
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "الوقت المتبقي للانتخابات :",
                    style: TextStyle(
                      color: Color(0xff2E8F5A),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "الإنتخابات العامة لمجلس الشعب الدورة التشريعية 2024",
                    style: TextStyle(
                      color: Color(0xff000401),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Image.asset(
                "assets/images/syria-logo-png_seeklogo-613100 1.png",
                height: 40,
                width: 40,
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTimeBox(days, "الأيام"),
              _buildTimeBox(hours, "الساعات"),
              _buildTimeBox(minutes, "الدقائق"),
              _buildTimeBox(seconds, "الثواني"),
            ],
          ),
        ],
      ),
    );
  }

  // دالة خاصة لإنشاء مربعات الوقت
  Widget _buildTimeBox(String value, String label) {
    return Expanded(
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Color(0x1A2E8F5A),
          border: Border.all(
            color: Color(0xFF2E8F5A),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.symmetric(horizontal: 4),
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xff2E8F5A),
              ),
            ),
            Text(
              label,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
