import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupController extends GetxController {
  // Text editing controllers
  final signupusernameController = TextEditingController();
  final signuppasswordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUsername = prefs.getString('username');

    if (savedUsername != null) {
      // If username is saved, navigate to the home page or main screen
      Get.offAllNamed('/dashboard'); // Replace '/home' with your desired route
    }
    update();
  }

///////sign in method
  void signUserIn() async {
    final username = signupusernameController.text.trim();
    final password = signuppasswordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar(
        "",
        "",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.transparent,
        snackStyle: SnackStyle.FLOATING,
        margin: const EdgeInsets.all(16),
        messageText: AwesomeSnackbarContent(
          title: "Error",
          titleTextStyle: GoogleFonts.acme(color: Colors.white, fontSize: 24),
          message: "Please enter both username and password",
          messageTextStyle: GoogleFonts.acme(color: Colors.white),
          contentType: ContentType.failure,
        ),
      );
      return;
    }

    // Save to SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);

    // Show success snackbar
    Get.snackbar(
      duration: Duration(milliseconds: 1000),
      "",
      "",
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.transparent,
      snackStyle: SnackStyle.FLOATING,
      margin: const EdgeInsets.all(16),
      messageText: AwesomeSnackbarContent(
        title: "Success",
        titleTextStyle: GoogleFonts.acme(color: Colors.white, fontSize: 24),
        messageTextStyle: GoogleFonts.acme(color: Colors.white),
        message: "Logged in as $username",
        contentType: ContentType.success,
      ),
    );

    // Navigate to the dashboard or home screen after successful login
    Get.offAllNamed(
        '/dashboard'); // Replace '/dashboard' with your desired route
  }

  @override
  void onClose() {
    // Dispose controllers when the controller is destroyed
    signupusernameController.dispose();
    signuppasswordController.dispose();
    super.onClose();
  }
}
