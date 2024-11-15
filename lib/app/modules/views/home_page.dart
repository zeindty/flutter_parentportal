import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/app/modules/views/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_register/app/modules/views/User.dart';

class HomeController extends GetxController {
  var count = 0.obs;
  var profile = User().obs;

  // Method to increment counter
  increment() => count++;

  // Load user data from SharedPreferences
  Future<void> loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString('user');

    // Check if user data exists and decode it
    if (userData != null && userData.isNotEmpty) {
      final user = jsonDecode(userData) as Map<String, dynamic>;
      // Set the user profile with the retrieved data
      profile.value = User(
        firstName: user['firstName'] ??
            '', // Provide fallback in case the key is missing
        image:
            user['image'] ?? '', // Provide fallback in case the key is missing
      );
    } else {
      // Handle the case when no user data is available
      profile.value = User(firstName: 'Unknown', image: ''); // Default values
    }
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Index for bottom navigation bar

  // List of screens corresponding to the bottom navigation bar items
  final List<Widget> _screens = [
    HomeScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];

  // Method to handle tab selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    final HomeController hc = Get.put(HomeController());

    // Ensure that the user data is loaded before rendering the UI
    hc.loadUser();

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text("Selamat Datang ${hc.profile.value.firstName}")),
      ),
      body: _screens[
          _selectedIndex], // Display the screen based on selected index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Set the selected index
        onTap: _onItemTapped, // Update the index when an item is tapped
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Screen'),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Settings Screen'),
    );
  }
}
