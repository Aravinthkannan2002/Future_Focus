import 'package:flutter/material.dart';

class SignupSquireTile extends StatelessWidget {
  final String imagePath;
  const SignupSquireTile({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey[200],
      ),
      child: Image.asset(
        imagePath,
        height: 40,
        fit: BoxFit.contain,
      ),
    );
  }
}
