import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/video_palyer_widget.dart';

class CandidatesPersonalPage extends StatefulWidget {
  const CandidatesPersonalPage({super.key});

  @override
  State<CandidatesPersonalPage> createState() => _CandidatesPersonalPageState();
}

class _CandidatesPersonalPageState extends State<CandidatesPersonalPage> {
  String selectedButton = 'حول المرشح';

  final List<String> videoUrls = [
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"
  ];

  final List<Map<String, String>> articles = [
    {
      "image": "assets/images/Rectangle 37.png",
      "title": "العدالة الانتقالية للسلطة",
      "date": "15/2/2024"
    },
    {
      "image": "assets/images/Rectangle 37.png",
      "title": "الإصلاحات السياسية المستقبلية",
      "date": "20/3/2024"
    },
    {
      "image": "assets/images/Rectangle 37.png",
      "title": "التحديات الاقتصادية والحلول",
      "date": "10/4/2024"
    }
  ];

  @override
  Widget build(BuildContext context) {
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
          children: <Widget>[
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
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, color: Colors.red),
                  ),
                ),
                Positioned(
                  top: 40,
                  child: Image.asset(
                    'assets/images/syria-logo-png_seeklogo-613100 1.png',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, color: Colors.red),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  child: const Text(
                    "سوريا نحو الأمل",
                    style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 140,
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/Rectangle 35.png",
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, color: Colors.red),
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
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 2, offset: const Offset(0, 2))],
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                    child: const Text("متابعة", style: TextStyle(color: Color(0xFF2E8F5A), fontSize: 18, fontWeight: FontWeight.bold)),
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
                        setState(() {
                          selectedButton = 'حول المرشح';
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: selectedButton == 'حول المرشح'
                                  ? const Color(0xff2E8F5A)
                                  : Colors.transparent,
                              width: 3,
                            ),
                          ),
                        ),
                        child: Text(
                          "حول المرشح",
                          style: TextStyle(
                            fontSize: 16,
                            color: selectedButton == 'حول المرشح'
                                ? const Color(0xff2E8F5A)
                                : Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedButton = 'البرنامج الانتخابي';
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: selectedButton == 'البرنامج الانتخابي'
                                  ? const Color(0xff2E8F5A)
                                  : Colors.transparent,
                              width: 3,
                            ),
                          ),
                        ),
                        child: Text(
                          "البرنامج الانتخابي",
                          style: TextStyle(
                            fontSize: 16,
                            color: selectedButton == 'البرنامج الانتخابي'
                                ? const Color(0xff2E8F5A)
                                : Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: selectedButton == 'حول المرشح'
                      ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("معلومات عن المرشح :", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xff2E8F5A))),
                      const Text("تاريخ الميلاد :  1-1-1996", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      const Text("مكان الولادة :  دمشق ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      const Text("المؤهل العلمي : هندسة مدنية ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 10),
                      const Text("فيديوهات :", style: TextStyle(color: Color(0xff2E8F5A), fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: videoUrls.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: VideoPlayerWidget(videoUrl: videoUrls[index]),
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
                          itemCount: articles.length,
                          itemBuilder: (BuildContext context, int index) {
                            final article = articles[index];
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
                  ):Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("البرنامج الانتخابي :",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xff2E8F5A))),
                      Text("- تعزيز التعليم وتطوير المناهج.", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      Text("- تحسين البنية التحتية والنقل.", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      Text("- دعم الاقتصاد الوطني وتشجيع الاستثمارات.", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
