import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/app/modules/views/home_page.dart';
import 'package:login_register/app/modules/views/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;
  var user = ''.obs;
  var isPasswordHidden = true.obs;
  var isFormValid = false.obs;
  var isAgreed = false.obs;

  void setUsername(String value) {
    username.value = value;
    validateForm();
  }

  void setPassword(String value) {
    password.value = value;
    validateForm();
  }

  void setAgreed(bool value) {
    isAgreed.value = value;
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void validateForm() {
    if (username.value.isNotEmpty && password.value.isNotEmpty) {
      isFormValid.value = true;
    } else {
      isFormValid.value = false;
    }
  }

  // Fungsi untuk login dan menyimpan status login menggunakan SharedPreferences
  Future<void> login() async {
    var url = Uri.https('dummyjson.com', 'auth/login');
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({
        'username': username.value,
        'password': password.value,
        'expiresInMins': 30,
      }),
    );

    print('Response body: ${response.body}');
    var userData = json.decode(response.body);

    if (response.statusCode == 200) {
      if (userData != null) {
        // Simulasi login berhasil
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('user', jsonEncode(userData));
        await prefs.setBool('isLoggedIn', true);
        // // Contoh penyimpanan token jika tersedia
        // if (userData['accessToken'] != null) {
        //   await prefs.setString('accessToken', userData['accessToken']);
        // }

        Get.offAll(() => HomePage());
      }
    } else {
      Get.snackbar(
        "Error",
        "Login failed. Please check your username and password.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    }
  }

  Future<void> loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    user.value = prefs.getString('user') ?? "";
  }

  // Fungsi untuk logout dan menghapus data login
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAllNamed('/login'); // Navigasi kembali ke halaman login
  }

  void loginWithGoogle() {
    print('Logging in with Google');
    Get.off(() => const WelcomeView());
  }
}
