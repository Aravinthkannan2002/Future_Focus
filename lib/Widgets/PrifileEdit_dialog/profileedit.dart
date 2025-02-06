import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class ProfileEditDialog extends StatelessWidget {
  final TextEditingController nameController;
  final RxString profileName;
  final Future<void> Function(String newName) onSave;

  ProfileEditDialog({
    required this.nameController,
    required this.profileName,
    required this.onSave,
  });

  void showSnackbar({
    required String title,
    required String message,
    required ContentType type,
  }) {
    Get.snackbar(
      "",
      "",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.transparent,
      snackStyle: SnackStyle.FLOATING,
      margin: const EdgeInsets.all(16),
      messageText: AwesomeSnackbarContent(
        title: title,
        message: message,
        titleTextStyle: GoogleFonts.acme(color: Colors.white, fontSize: 24),
        messageTextStyle: GoogleFonts.acme(color: Colors.white),
        contentType: type,
      ),
      isDismissible: true,
      duration: const Duration(milliseconds: 1000),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[300],
      title: Center(
        child: Text(
          "Edit Profile Name",
          style: GoogleFonts.acme(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 20,
          ),
          TextField(
            cursorHeight: 18,
            cursorColor: Colors.black,
            controller: nameController,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              hintText: 'Enter name...',
              hintStyle: GoogleFonts.acme(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.grey,
              ),
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
            ),
            style: const TextStyle(fontSize: 16.0),
            keyboardType: TextInputType.name,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                nameController.clear();
                Get.back(); // Close the dialog
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final newName = nameController.text.trim();
                if (newName.isNotEmpty) {
                  profileName.value = newName;
                  nameController.clear();
                  await onSave(newName); // Save the new name
                  Get.back(); // Close the dialog
                  showSnackbar(
                    title: "Success",
                    message: "Name has been updated successfully!",
                    type: ContentType.success,
                  );
                } else {
                  showSnackbar(
                    title: "Error",
                    message: "Name cannot be empty!",
                    type: ContentType.failure,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Save",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        )
      ],
    );
  }
}
