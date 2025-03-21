import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/member_card.dart'; // استيراد الويدجت الجديدة

class MembersPage extends StatefulWidget {
  const MembersPage({super.key});

  @override
  State<MembersPage> createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  TextEditingController searchController = TextEditingController();

  final List<Map<String, String?>> members = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Directionality(
        textDirection: TextDirection.rtl,
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
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  controller: searchController,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    hintText: "ابحث عن ما تريد...",
                    prefixIcon: const Icon(Icons.search, color: Colors.green),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView.builder(
                  itemCount: members.length,
                  itemBuilder: (context, index) {
                    final member = members[index];
                    return MemberCard(
                      name: member["name"]!,
                      governorate: member["governorate"],
                      category: member["category"],
                      party: member["party"],
                      imagePath: member["imagePath"]!,
                      partyLogoPath: member["partyLogoPath"],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
