import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Widgets/loginpage_components/square_tile.dart';
import '../../../../Widgets/signuppage_components/signup_button.dart';
import '../../../../Widgets/signuppage_components/signup_textfield.dart';
import '../../login/views/login_view.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final SignupController LoginController = Get.put(SignupController());
  SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor:Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        // physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 25),

                // logo
                Icon(
                  color: Colors.deepOrange,
                  Icons.lock,
                  size: screenWidth *
                      0.2, // Adjust logo size based on screen width
                ),

                const SizedBox(height: 50),

                // welcome back, you've been missed!
                Text(
                  'Lets create an Account For You!',
                  style: GoogleFonts.acme(
                    color: Colors.grey[800],
                    fontSize: screenWidth *
                        0.04, // Adjust text size based on screen width
                  ),
                ),

                const SizedBox(height: 25),

                // username textfield
                signup_textfield(
                  controller: controller.signupusernameController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                signup_textfield(
                  controller: controller.signuppasswordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 10),

                //confirm Password
                signup_textfield(
                  controller: controller.confirmpasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),

                const SizedBox(height: 25),

                // sign in button
                SignupButton(
                  onTap: controller
                      .signUserIn, // This calls the signUserIn method from your controller
                ),

                const SizedBox(height: 50),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: GoogleFonts.acme(
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    GestureDetector(
                      child: SquareTile(imagePath: 'asset/images/google.png'),
                      onTap: () {
                        print("Google Button");
                      },
                    ),

                    SizedBox(
                        width: screenWidth *
                            0.05), // Adjust spacing based on screen width

                    // apple button
                    GestureDetector(
                      child: SquareTile(imagePath: 'asset/images/apple.png'),
                      onTap: () {
                        print("Twitter Button");
                      },
                    )
                  ],
                ),

                const SizedBox(height: 20),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'already have an Account?',
                      style: GoogleFonts.acme(
                        color: Colors.grey[800],
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      child: Text(
                        'login Now',
                        style: GoogleFonts.acme(
                          color:Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Get.to(LoginView());
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
