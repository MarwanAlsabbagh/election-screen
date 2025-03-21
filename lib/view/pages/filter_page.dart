import 'package:flutter/material.dart';

void showFilterModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // لتحديد أن الحجم يمكن التحكم فيه
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // للحفاظ على المساحة الصغيرة
          children: [
            Text('فلتر حسب:', style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 20),

            // Dropdown 1
            DropdownButtonFormField<String>(
              items: ['الاختيار 1', 'الاختيار 2', 'الاختيار 3'].map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: 'الفلتر الأول',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Dropdown 2
            DropdownButtonFormField<String>(
              items: ['الخيار A', 'الخيار B', 'الخيار C'].map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: 'الفلتر الثاني',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Dropdown 3
            DropdownButtonFormField<String>(
              items: ['الاختيار X', 'الاختيار Y', 'الاختيار Z'].map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: 'الفلتر الثالث',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // زر لتأكيد الفلتر
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // إغلاق النافذة عند التأكيد
              },
              child: const Text('تأكيد الفلتر'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E8F5A), // استخدام نفس اللون
              ),
            ),
          ],
        ),
      );
    },
  );
}
