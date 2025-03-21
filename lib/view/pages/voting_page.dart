import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/search_bar_with_filter.dart';
import '../widgets/voting_card.dart';
import 'filter_page.dart';

class VotingPage extends StatefulWidget {
  const VotingPage({super.key});

  @override
  State<VotingPage> createState() => _VotingPageState();
}

class _VotingPageState extends State<VotingPage> {
  TextEditingController searchController = TextEditingController();
  final List<Map<String, String>> candidates = [
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
  ];
  List<String> selectedCandidates = [];

  void toggleSelection(bool? selected, String name) {
    setState(() {
      if (selected == true) {
        selectedCandidates.add(name);
      } else {
        selectedCandidates.remove(name);
      }
    });
  }

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
              SearchBarWithFilter(
                controller: searchController,
                onFilterPressed: () {
                  showFilterModal(context);
                },
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: candidates.length,
                  itemBuilder: (context, index) {
                    final candidate = candidates[index];
                    return VotingCard(
                      name: candidate["name"]!,
                      governorate: candidate["governorate"],
                      category: candidate["category"],
                      party: candidate["party"],
                      imagePath: candidate["imagePath"]!,
                      partyLogoPath: candidate["partyLogoPath"],
                      onSelected: (selected) =>
                          toggleSelection(selected, candidate["name"]!),
                    );
                  },
                ),
              ),
              SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    text: 'تصويت',
                    onPressed: () {},
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
