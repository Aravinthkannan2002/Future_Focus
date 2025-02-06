import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../Widgets/snackbars/showsnackbars.dart';

class LoginController extends GetxController {
  //  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

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
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      showSnackbar(
        title: "Error",
        message: "Please enter both username and password",
        type: ContentType.failure,
      );
      return;
    }

    // Save to SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);

    // Show success snackbar
    showSnackbar(
      title: "Success",
      message: "Logged in as $username",
      type: ContentType.success,
    );

    // Navigate to the dashboard or home screen after successful login
    Get.offAllNamed(
        '/home'); // Replace '/dashboard' with your desired route
  }

////////for firebase
//  Future<User?> loginWithEmailPassword(String email, String password) async {
//     try {
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return userCredential.user;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }
  @override
  void onClose() {
    // Dispose controllers when the controller is destroyed
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
