import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/app/core/utils/colors.dart';
import 'package:login_register/app/modules/views/login.dart';
import 'package:login_register/app/modules/views/register.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    // Mengakses ColorsController yang sudah diinisialisasi melalui GetX
    final ColorsController colorsController = Get.find<ColorsController>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Welcome",
            style: TextStyle(
              fontSize: 20,
              fontFamily: "InterMedium",
            ),
          ),
          backgroundColor: colorsController.blueColor,
          centerTitle: true,
        ),
        body: Center(
          // Menambahkan Center agar konten berada di tengah layar
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 69),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          "Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "InterBold",
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi efficitur dolor quis purus lobortis, in vulputate arcu tincidunt.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "InterMedium",
                            fontSize: 12,
                            color: colorsController
                                .fontGrayColor, // Menggunakan warna dari GetX controller
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(55, 0, 55, 78),
                  child: Image.asset(
                    "assets/images/welcome.png",
                    width: 300,
                    height: 300,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GestureDetector(
                    onTap: () {
                      print("Navigating to RegisterView");
                      Get.to(() => const RegisterView());
                    },

                    // Menggunakan fungsi dari controller
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 13.5),
                      decoration: BoxDecoration(
                          color: colorsController.blueColor,
                          borderRadius: BorderRadius.circular(4)),
                      child: const Text(
                        "Buat Akun",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "InterSemiBold",
                            fontSize: 12,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GestureDetector(
                    onTap: () {
                      //Navigasi ke LoginView ketika Button "Masuk" ditekan
                      Get.to(() => const LoginView());
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 13.5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4)),
                      child: Text(
                        "Masuk",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "InterSemiBold",
                          fontSize: 12,
                          color: colorsController.blueColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
