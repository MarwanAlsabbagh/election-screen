import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled8/view/pages/candidates_personal_page.dart';
import 'package:untitled8/view/pages/home_page.dart';
import 'package:untitled8/view/pages/members_page.dart';
import 'package:untitled8/view/pages/parties_page.dart';
import 'package:untitled8/view/pages/parties_personal_page.dart';
import 'package:untitled8/view/pages/voting_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:  HomePage(),

    );
  }
}
