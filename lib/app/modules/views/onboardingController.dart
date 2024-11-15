import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/app/modules/views/welcome.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs; // Observable integer untuk current page
  PageController pageController =
      PageController(); // Page controller untuk pageview

  // Fungsi untuk mengupdate halaman yang sedang aktif
  void onPageChanged(int page) {
    currentPage.value = page; // Menggunakan .value untuk mengupdate obs
  }

// Fungsi untuk berpindah halaman
  void nextPage() {
    if (currentPage.value < 2) {
      // Pindahkan ke halaman berikutnya di PageView
      pageController.animateToPage(currentPage.value + 1,
          duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
    } else {
      // Jika sudah di halaman terakhir, pindah ke halaman berikutnya menggunakan GetX
      Get.off(() =>
          const WelcomeView()); // Navigasi ke WelcomeView dan menggantikan halaman onboarding
    }
  }

  void skipToEnd() {
    pageController.animateToPage(2,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }
}
