import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/splashscreen_controller.dart';
import 'package:lottie/lottie.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashscreenController>(
        builder: (controller) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Replace this with your logo or animation
                Icon(Icons.flash_on, size: 100, color: Colors.deepOrange),
                SizedBox(height: 20),
                Text(
                  'FutureFocus',
                  style: GoogleFonts.acme(color: Colors.black, fontSize: 16),
                ),
                SizedBox(
                  height: 200,
                ),
                Container(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.deepOrange),
                    strokeWidth: 4.0,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
