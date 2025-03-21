import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled8/view/widgets/parties_card.dart';

import '../widgets/custom_app_bar.dart';

class PartiesPage extends StatefulWidget {
  const PartiesPage({super.key});

  @override
  State<PartiesPage> createState() => _PartiesPageState();
}

class _PartiesPageState extends State<PartiesPage> {
  TextEditingController searchController = TextEditingController();

  final List<Map<String, dynamic>> parties = [
    {
      "name": "حزب العمال الديمقراطي",
      "governorate": "دمشق",
      "imagePath": "assets/Logo.png",
      "numbermembers": 120,
    },
    {
      "name": "حزب العمال الديمقراطي",
      "governorate": "دمشق",
      "imagePath": "assets/Logo.png",
      "numbermembers": 120,
    },
    {
      "name": "حزب العمال الديمقراطي",
      "governorate": "دمشق",
      "imagePath": "assets/Logo.png",
      "numbermembers": 120,
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
              // حقل البحث
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
                  itemCount: parties.length,
                  itemBuilder: (context, index) {
                    final party = parties[index];
                    return PartiesCard(
                      name: party["name"]!,
                      governorate: party["governorate"]!,
                      imagePath: party["imagePath"]!,
                      numberMember: party["numbermembers"]!,
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
