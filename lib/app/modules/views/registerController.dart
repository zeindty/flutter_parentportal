import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var parentName = ''.obs;
  var email = ''.obs;
  var phoneNumber = ''.obs;
  var address = ''.obs;
  var childName = ''.obs;
  var selectedClass = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;
  var agreedToTerms = false.obs;

  void setParentName(String value) => parentName.value = value;
  void setEmail(String value) => email.value = value;
  void setPhoneNumber(String value) => phoneNumber.value = value;
  void setAddress(String value) => address.value = value;
  void setChildName(String value) => childName.value = value;
  void setSelectedClass(String value) => selectedClass.value = value;
  void setPassword(String value) => password.value = value;
  void setConfirmPassword(String value) => confirmPassword.value = value;
  void setAgreedToTerms(bool value) => agreedToTerms.value = value;

  // Validasi sebelum melakukan register
  bool validateRegistration() {
    return parentName.isNotEmpty &&
        email.isNotEmpty &&
        phoneNumber.isNotEmpty &&
        address.isNotEmpty &&
        childName.isNotEmpty &&
        selectedClass.isNotEmpty &&
        password.isNotEmpty &&
        password.value == confirmPassword.value &&
        agreedToTerms.value;
  }

  void register() {
    if (validateRegistration()) {
      print("Registration Successful");
      // Lakukan logika pendaftaran atau navigasi ke halaman berikutnya
    } else {
      Get.snackbar(
        "Error",
        "Please fill all fields correctly and agree to the terms",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    }
  }
}
