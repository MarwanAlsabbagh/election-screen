import 'package:flutter/material.dart';

class VotingCard extends StatefulWidget {
  final String name;
  final String? governorate;
  final String? category;
  final String? party;
  final String imagePath;
  final String? partyLogoPath;
  final Function(bool?) onSelected;

  const VotingCard({
    Key? key,
    required this.name,
    this.governorate,
    this.category,
    this.party,
    required this.imagePath,
    this.partyLogoPath,
    required this.onSelected,
  }) : super(key: key);

  @override
  _VotingCardState createState() => _VotingCardState();
}

class _VotingCardState extends State<VotingCard> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F8),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isChecked ? const Color(0xff2E8F5A) : const Color(0xFFE4E7EC), // تغيير لون الإطار عند التحديد
          width: 2, // جعل الإطار أكثر وضوحًا عند التحديد
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // صورة المرشح
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              widget.imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // اسم المرشح
                Text(
                  widget.name,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),

                // المحافظة والفئة
                if (widget.governorate != null || widget.category != null)
                  Wrap(
                    spacing: 12,
                    children: [
                      if (widget.governorate != null) _infoLabel("المحافظة:", widget.governorate!),
                      if (widget.category != null) _infoLabel("الفئة:", widget.category!),
                    ],
                  ),
                const SizedBox(height: 6),

                // الحزب
                if (widget.party != null && widget.partyLogoPath != null)
                  Row(
                    children: [
                      Image.asset(widget.partyLogoPath!, width: 20, height: 20),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          widget.party!,
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),

          // صندوق الاختيار (Checkbox)
          Checkbox(
            value: isChecked,
            activeColor: const Color(0xff2E8F5A), // تغيير لون صندوق التحديد عند التحديد
            checkColor: Colors.white, // لون علامة الصح داخل الـ Checkbox
            onChanged: (bool? newValue) {
              setState(() {
                isChecked = newValue ?? false;
              });
              widget.onSelected(newValue);
            },
          ),
        ],
      ),
    );
  }

  Widget _infoLabel(String title, String value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: Color(0xff2E8F5A), fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 4),
        Text(value, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
