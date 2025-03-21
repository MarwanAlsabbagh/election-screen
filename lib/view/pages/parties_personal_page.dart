import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/party_controller.dart';
import '../widgets/member_card.dart';
import '../widgets/video_palyer_widget.dart';

class PartiesPeersonalPage extends StatelessWidget {
  const PartiesPeersonalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PartyController partyController = Get.put(PartyController());

    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        title: const Text(
          "التفاصيل",
          style: TextStyle(
            fontSize: 22,
            color: Color(0xff000401),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xff2E8F5A),
            size: 28,
          ),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
          // محتوى الصفحة كما هو بدون تعديل
          Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              color: const Color(0xFF2E8F5A),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/Vector (1).png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.error, color: Colors.red),
              ),
            ),
            Positioned(
              top: 40,
              child: Image.asset(
                'assets/images/syria-logo-png_seeklogo-613100 1.png',
                width: 90,
                height: 90,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.error, color: Colors.red),
              ),
            ),
            Positioned(
              bottom: 30,
              child: const Text(
                "سوريا نحو الأمل",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              right: 10,
              top: 140,
              child: Container(
                width: 110, // حجم الخلفية
                height: 110, // حجم الخلفية
                decoration: BoxDecoration(
                  color: Colors.white, // جعل الخلفية بيضاء
                  shape: BoxShape.circle, // للحفاظ على الشكل الدائري
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // إضافة ظل خفيف
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10), // تصغير الصورة داخل الخلفية
                  child: ClipOval(
                    child: Image.asset(
                      "assets/Logo.png",
                      width: 100,
                      height: 100,
                      fit: BoxFit.none,
                      errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error, color: Colors.red),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {},
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFF2E8F5A)),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 2,
                        offset: const Offset(0, 2))
                  ],
                ),
                padding:
                const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                child: const Text("متابعة",
                    style: TextStyle(
                        color: Color(0xFF2E8F5A),
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    partyController.changeSelectedButton('حول الحزب');
                  },
                  child: Obx(() => Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: partyController.selectedButton.value == 'حول الحزب'
                              ? const Color(0xff2E8F5A)
                              : Colors.transparent,
                          width: 3,
                        ),
                      ),
                    ),
                    child: Text(
                      "حول الحزب",
                      style: TextStyle(
                        fontSize: 16,
                        color: partyController.selectedButton.value == 'حول الحزب'
                            ? const Color(0xff2E8F5A)
                            : Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    partyController.changeSelectedButton('اعضاء الحزب');
                  },
                  child: Obx(() => Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: partyController.selectedButton.value == 'اعضاء الحزب'
                              ? const Color(0xff2E8F5A)
                              : Colors.transparent,
                          width: 3,
                        ),
                      ),
                    ),
                    child: Text(
                      "اعضاء الحزب",
                      style: TextStyle(
                        fontSize: 16,
                        color: partyController.selectedButton.value == 'اعضاء الحزب'
                            ? const Color(0xff2E8F5A)
                            : Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Obx(() => partyController.selectedButton.value == 'حول الحزب'
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("معلومات عن الحزب :", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xff2E8F5A))),
                  const Text("تاريخ التأسيس :  1-1-1996", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  const Text("المقر :  دمشق ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  const Text("عدد الأاعضاء 150عضوا", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 10),
                  const Text("فيديوهات :", style: TextStyle(color: Color(0xff2E8F5A), fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: partyController.videoUrls.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: VideoPlayerWidget(videoUrl: partyController.videoUrls[index]),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text("مقالات :", style: TextStyle(color: Color(0xff2E8F5A), fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: partyController.articles.length,
                      itemBuilder: (BuildContext context, int index) {
                        final article = partyController.articles[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            width: 200,
                            height: 250,
                            child: Column(
                              children: [
                                Image.asset(
                                  article["image"] ?? "",
                                  fit: BoxFit.cover,
                                  width: 200,
                                  height: 120,
                                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, color: Colors.red),
                                ),
                                Text(article["title"] ?? "", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                Text(article["date"] ?? "", style: const TextStyle(fontSize: 18, color: Colors.grey)),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("الأمين العام للحزب :",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff2E8F5A))),
                  const SizedBox(height: 10),
                  MemberCard(
                    name: 'يوسف بيرقدار',
                    imagePath: 'assets/images/Rectangle 35.png',
                    category: ' أ',
                    governorate: "دمشق",
                    party: 'حزب العمال الديمقراطي',
                  ),
                  const SizedBox(height: 10),
                  Text("نائب الامين العام للحزب :",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff2E8F5A))),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: partyController.members.length,
                    itemBuilder: (context, index) {
                      final member = partyController.members[index];
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
                  const SizedBox(height: 10),
                  Text("أعضاء الحزب :",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff2E8F5A))),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: partyController.members.length,
                    itemBuilder: (context, index) {
                      final member = partyController.members[index];
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
                ],
              ),
              ),
            ),
          ),
        ),
          ],
        ),
      ),
    );
  }
}
