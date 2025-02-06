import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/onboardingscreen_controller.dart';

class OnboardingscreenView extends GetView<OnboardingscreenController> {
  final PageController _pageController = PageController();
  OnboardingscreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) => controller.currentPage.value = index,
              children: [
                _buildPage(
                  image: 'asset/images/10599813.webp', // Correct path here
                  title: 'Welcome!',
                  description:
                      'Discover the exciting features and functionality of our app to enhance your experience.',
                ),
                _buildPage(
                  image: 'asset/images/10599821.webp',
                  title: 'Track Your Progress',
                  description:
                      'Monitor your attendance effortlessly and stay on top of your progress with ease.',
                ),
                _buildPage(
                  image: 'asset/images/10599823.webp',
                  title: 'Get Started',
                  description:
                      'Begin your journey with a simple step and set the foundation for success!',
                ),
              ],
            ),
          ),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                bool isActive = controller.currentPage.value == index;
                return AnimatedContainer(
                  duration: Duration(milliseconds: 500), // Smooth animation
                  curve: Curves.easeInOut, // Easing effect
                  margin: EdgeInsets.symmetric(horizontal: 6.0),
                  width: isActive ? 20 : 10, // Active indicator is wider
                  height: 10, // Height remains consistent
                  decoration: BoxDecoration(
                    shape: BoxShape
                        .rectangle, // Shape transition for active indicators
                    borderRadius: BorderRadius.circular(
                        isActive ? 12 : 4), // Rounded corners
                    color: isActive
                        ? Colors.deepOrange
                        : Colors.grey.withOpacity(0.6),
                    boxShadow: isActive
                        ? [
                            BoxShadow(
                              color: Colors.deepOrange.withOpacity(0.6),
                              blurRadius: 8,
                              spreadRadius: 1,
                            ),
                          ]
                        : [],
                  ),
                );
              }),
            );
          }),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Skip Button with better styling
                  TextButton(
                    onPressed: controller.skipToHome,
                    child: Text(
                      'Skip',
                      style: GoogleFonts.acme(
                          color: Colors.grey[800], fontSize: 16),
                    ),
                  ),
                  // Next/Get Started Button
                  Obx(() {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange, // Custom color
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        if (controller.currentPage.value == 2) {
                          controller
                              .skipToHome(); // Navigate to home if last page
                        } else {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        transitionBuilder: (child, animation) {
                          return ScaleTransition(
                              scale: animation, child: child);
                        },
                        child: Text(
                          controller.currentPage.value == 2
                              ? 'Get Started'
                              : 'Next',
                          key: ValueKey(controller
                              .currentPage.value), // Key for animation
                          style: GoogleFonts.acme(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  }),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildPage({
    required String image,
    required String title,
    required String description,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 200),
        SizedBox(height: 20),
        Text(
          title,
          style: GoogleFonts.acme(fontSize: 22),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.acme(color: Colors.grey[800], fontSize: 16),
          ),
        ),
      ],
    );
  }
}
