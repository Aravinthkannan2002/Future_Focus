import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}




// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   Get.put(ProfileController());

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   final ProfileController profileController = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       return GetMaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: "Application",
//         initialRoute: AppPages.INITIAL,
//         getPages: AppPages.routes,
//         theme: profileController.isDarkMode.value
//             ? profileController.darkTheme
//             : profileController.lightTheme,
//       );
//     });
//   }
// }