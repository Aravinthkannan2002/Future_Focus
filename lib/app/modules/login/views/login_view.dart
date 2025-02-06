import 'package:flutter/material.dart';
import 'package:future_focus/Widgets/loginpage_components/square_tile.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Widgets/loginpage_components/my_button.dart';
import '../../../../Widgets/loginpage_components/my_textfield.dart';
import '../../signup/views/signup_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GetBuilder<LoginController>(builder: (Controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),

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
                    'Welcome back you\'ve been missed!',
                    style: GoogleFonts.acme(
                      color:Colors.grey[800],
                      fontSize: screenWidth *
                          0.04, // Adjust text size based on screen width
                    ),
                  ),

                  const SizedBox(height: 25),

                  // username textfield
                  MyTextField(
                    controller: controller.usernameController,
                    hintText: 'Email',
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),

                  // password textfield
                  MyTextField(
                    controller: controller.passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),

                  const SizedBox(height: 10),

                  // forgot password?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: GoogleFonts.acme(color: Colors.grey[800]),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                 // sign in button
                  MyButton(
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
                              color: Colors.grey[800]
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
                        child:
                            SquareTile(imagePath: 'asset/images/google.png'),
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
                        'Not a member?',
                        style: GoogleFonts.acme(
                          color: Colors.grey[800]
                        ),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        child: Text(
                          'Register now',
                          style: GoogleFonts.acme(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          Get.to(SignupView());
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
    });
  }
}
