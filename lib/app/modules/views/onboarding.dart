import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/app/core/utils/colors.dart';
import 'package:login_register/app/modules/views/onboardingController.dart';

List onboardingData = [
  {
    "image": "assets/images/onboarding1.png",
    "title": "1.Lorem ipsum dolor sit amet, consectetur \nadipiscing elit.",
    "desc":
        "1.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi efficitur dolor quis purus lobortis, in vulputate arcu tincidunt.",
  },
  {
    "image": "assets/images/onboarding3.png",
    "title": "2.Lorem ipsum dolor sit amet, consectetur \nadipiscing elit.",
    "desc": 
        "2.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi efficitur dolor quis purus lobortis, in vulputate arcu tincidunt.",
  },
  {
    "image": "assets/images/onboarding2.png",
    "title": "3.Lorem ipsum dolor sit amet, consectetur \nadipiscing elit.",
    "desc":
        "3.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi efficitur dolor quis purus lobortis, in vulputate arcu tincidunt.",
  },
];

class OnboardingViews extends StatelessWidget {
  OnboardingViews({super.key});

  final OnboardingController onboardingController =
      Get.put(OnboardingController()); // Inisialisasi controller

  @override
  Widget build(BuildContext context) {
    // Akses ColorsController yang sudah diinisialisasi
    final ColorsController colorsController = Get.find<ColorsController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Onboarding",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "InterMedium",
          ),
        ),
        backgroundColor: colorsController.blueColor,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: onboardingController.pageController,
              onPageChanged: onboardingController
                  .onPageChanged, // Panggil fungsi controller
              itemCount: onboardingData.length,
              itemBuilder: (_, i) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      onboardingData[i]['image'],
                      width: 200,
                      height: 200,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Text(
                              onboardingData[i]['title'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: "InterBold",
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 17),
                            child: Text(
                              onboardingData[i]
                                  ['desc'], // Menggunakan deskripsi yang benar
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
                  ],
                );
              },
            ),
          ),

          //icon pindah halaman
          Obx(() => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Wrap(
                      spacing: 6,
                      children: List.generate(
                        3,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          decoration: BoxDecoration(
                              color: onboardingController.currentPage.value ==
                                      index
                                  ? colorsController.blueColor
                                  : colorsController.grayColor,
                              borderRadius: BorderRadius.circular(1000)),
                          height: 8,
                          width: onboardingController.currentPage.value == index
                              ? 20
                              : 8,
                        ),
                      ),
                    ),
                  ),

                  //Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GestureDetector(
                      onTap: onboardingController
                          .nextPage, // Menggunakan fungsi dari controller
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 13.5),
                        decoration: BoxDecoration(
                            color: colorsController.blueColor,
                            borderRadius: BorderRadius.circular(4)),
                        child: Text(
                          onboardingController.currentPage.value == 2
                              ? "Mulai Sekarang"
                              : "Lanjutkan",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontFamily: "InterSemiBold",
                              fontSize: 12,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  
                  onboardingController.currentPage.value == 2
                      ? const SizedBox(height: 44)
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: GestureDetector(
                            onTap: onboardingController
                                .skipToEnd, // Skip langsung ke akhir
                            child: Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 13.5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Text(
                                "Lewati",
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
              )),
        ],
      ),
    );
  }
}
