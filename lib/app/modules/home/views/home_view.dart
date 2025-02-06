import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Top Container
          Container(
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text(
                    'Hello Aravinth!',
                    style: GoogleFonts.acme(color: Colors.white, fontSize: 24),
                  ),
                  subtitle: Text(
                    'Welcom To FutureFocus',
                    style: GoogleFonts.acme(color: Colors.white, fontSize: 14),
                  ),
                  trailing: ClipOval(
                    child: Image.asset(
                      'asset/images/profile.jpg',
                      width: 60, // Same as 2 * radius for CircleAvatar
                      height: 60, // Same as 2 * radius for CircleAvatar
                      fit: BoxFit
                          .cover, // Ensures the image is scaled and cropped appropriately
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
          // Grid Container
          Container(
            color: Colors.deepOrange,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(200)),
                ),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 30,
                  children: [
                    itemDashboard(
                      context,
                      'Syllabus',
                      CupertinoIcons.book,
                      Colors.deepOrange,
                      () => Get.toNamed(
                          '/syllabus'), // Example: Navigate to Syllabus page
                    ),
                    itemDashboard(
                      context,
                      'Games',
                      CupertinoIcons.game_controller,
                      Colors.blue,
                      () => Get.toNamed(
                          '/games'), // Example: Navigate to Games page
                    ),
                    itemDashboard(
                      context,
                      'Assignments',
                      CupertinoIcons.doc_text,
                      Colors.green,
                      () => Get.toNamed(
                          '/assignments'), // Example: Navigate to Assignments page
                    ),
                    itemDashboard(
                      context,
                      'Grades',
                      CupertinoIcons.chart_bar,
                      Colors.purple,
                      () => Get.toNamed(
                          '/grade'), // Example: Navigate to Grades page
                    ),
                    itemDashboard(
                      context,
                      'Attendance',
                      CupertinoIcons.checkmark_circle,
                      Colors.indigo,
                      () => Get.toNamed(
                          '/attendance'), // Example: Navigate to Attendance page
                    ),
                    itemDashboard(
                      context,
                      'Resources',
                      CupertinoIcons.folder,
                      Colors.teal,
                      () => Get.toNamed(
                          '/resources'), // Example: Navigate to Resources page
                    ),
                    itemDashboard(
                      context,
                      'Help & support',
                      CupertinoIcons.info_circle,
                      Colors.brown,
                      () => Get.toNamed(
                          '/helpsupport'), // Example: Navigate to About Us page
                    ),
                    itemDashboard(
                      context,
                      'Contact Us',
                      CupertinoIcons.phone,
                      Colors.pinkAccent,
                      () => Get.toNamed(
                          '/chat'), // Example: Navigate to Contact Us page
                    ),
                  ],
                )),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  /// Updated `itemDashboard` function with `BuildContext` parameter
  Widget itemDashboard(BuildContext context, String title, IconData iconData,
      Color background, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap, // Action to perform on tap
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              color: Theme.of(context).primaryColor.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: background,
                shape: BoxShape.circle,
              ),
              child: Icon(iconData, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              title.toUpperCase(),
              style: GoogleFonts.acme(color: Colors.black, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}



// children: [
//                   itemDashboard(context, 'Videos',
//                       CupertinoIcons.play_rectangle, Colors.deepOrange),
//                   itemDashboard(context, 'Analytics',
//                       CupertinoIcons.graph_circle, Colors.green),
//                   itemDashboard(context, 'Audience', CupertinoIcons.person_2,
//                       Colors.purple),
//                   itemDashboard(context, 'Comments',
//                       CupertinoIcons.chat_bubble_2, Colors.brown),
//                   itemDashboard(context, 'Revenue',
//                       CupertinoIcons.money_dollar_circle, Colors.indigo),
//                   itemDashboard(context, 'Upload', CupertinoIcons.add_circled,
//                       Colors.teal),
//                   itemDashboard(context, 'About',
//                       CupertinoIcons.question_circle, Colors.blue),
//                   itemDashboard(context, 'Contact', CupertinoIcons.phone,
//                       Colors.pinkAccent),
//                 ],