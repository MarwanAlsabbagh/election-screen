import 'package:flutter/material.dart';

class MemberCard extends StatelessWidget {
  final String name;
  final String? governorate; // اختيارية
  final String? category; // اختيارية
  final String? party; // اختيارية
  final String imagePath;
  final String? partyLogoPath; // اختيارية

  const MemberCard({
    Key? key,
    required this.name,
    this.governorate,
    this.category,
    this.party,
    required this.imagePath,
    this.partyLogoPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F8), // لون الخلفية
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE4E7EC), // لون الإطار
          width: 1, // حجم الإطار
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // صورة النائب (أكبر حجمًا)
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              width: 90, // تم تكبير الصورة
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),

          // معلومات النائب
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // اسم النائب (أكبر حجمًا)
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18, // تم تكبير الخط
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),

                // المحافظة والفئة (عرض فقط إذا كانت موجودة)
                if (governorate != null || category != null)
                  Row(
                    children: [
                      if (governorate != null) _infoLabel("المحافظة:", governorate!),
                      if (governorate != null && category != null) const SizedBox(width: 12),
                      if (category != null) _infoLabel("الفئة:", category!),
                    ],
                  ),
                const SizedBox(height: 6),

                // الحزب والشعار (عرض فقط إذا كان موجودًا)
                if (party != null && partyLogoPath != null)
                  Row(
                    children: [
                      const Text(
                        "الحزب:",
                        style: TextStyle(fontSize: 14, color: Color(0xff2E8F5A)), // تكبير الخط
                      ),
                      const SizedBox(width: 6),
                      Image.asset(
                        partyLogoPath!,
                        width: 20, // تكبير شعار الحزب
                        height: 20,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        party!,
                        style: const TextStyle(
                          fontSize: 14, // تكبير الخط
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ويدجت مساعدة لتنسيق المعلومات
  Widget _infoLabel(String title, String value) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14, // تكبير الخط
            color: Color(0xff2E8F5A),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          value,
          style: const TextStyle(fontSize: 14), // تكبير الخط
        ),
      ],
    );
  }
}
