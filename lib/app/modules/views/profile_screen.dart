import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/app/modules/views/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_register/app/modules/views/User.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController hc = Get.put(HomeController());

    return FutureBuilder(
      future: hc.loadUser(), // Load user data when the Profile screen is opened
      builder: (context, snapshot) {
        // Check if the user data is loaded
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text("Error loading user data"));
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Image
              Obx(() => CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      hc.profile.value.image.isNotEmpty
                          ? hc.profile.value.image
                          : 'https://www.example.com/default_image.png', // Default image if none exists
                    ),
                  )),

              const SizedBox(height: 16),

              // Name (First Name)
              Obx(() => Text(
                    hc.profile.value.firstName.isNotEmpty
                        ? hc.profile.value.firstName
                        : 'No Name Provided',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  )),

              const SizedBox(height: 8),

              // Username (You can update this with a username if it's available in your model)
              Obx(() => Text(
                    hc.profile.value.firstName.isNotEmpty
                        ? 'Username: ${hc.profile.value.firstName}' // Replace with actual username if available
                        : 'No Username Provided',
                    style: TextStyle(fontSize: 18),
                  )),

              const SizedBox(height: 8),

              // Email (You can update this with email if it's available in your model)
              Obx(() => Text(
                    hc.profile.value.firstName.isNotEmpty
                        ? 'Email: user@example.com' // Replace with actual email if available
                        : 'No Email Provided',
                    style: TextStyle(fontSize: 18),
                  )),

              const SizedBox(height: 16),

              // Edit button (optional)
              ElevatedButton(
                onPressed: () {
                  // Navigate to edit profile page
                },
                child: Text("Edit Profile"),
              ),
            ],
          ),
        );
      },
    );
  }
}
