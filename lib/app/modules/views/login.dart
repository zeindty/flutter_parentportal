import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/app/modules/views/loginController.dart';
import 'package:login_register/app/core/utils/colors.dart';
import 'package:login_register/app/modules/views/register.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    final ColorsController colorsController = Get.find<ColorsController>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
          backgroundColor: colorsController.blueColor,
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8, // Adjust container width
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Image at the top
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Image.asset(
                        'assets/logo/kindergarten.png',
                        width: 100,
                        height: 100,
                      ),
                    ),

                    // Welcome text
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Selamat Datang!',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // Username field
                    TextField(
                      onChanged: loginController.setUsername,
                      decoration: const InputDecoration(
                        labelText: "Username",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Password field with visibility toggle
                    Obx(() => TextField(
                          onChanged: loginController.setPassword,
                          obscureText: loginController.isPasswordHidden.value,
                          decoration: InputDecoration(
                            labelText: "Password",
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(loginController.isPasswordHidden.value
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: loginController.togglePasswordVisibility,
                            ),
                          ),
                        )),
                    const SizedBox(height: 16),

                    // Login button
                    Obx(() => GestureDetector(
                          onTap: loginController.username.value.isNotEmpty &&
                                  loginController.password.value.isNotEmpty
                              ? loginController.login
                              : null,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                              color: loginController.username.value.isNotEmpty &&
                                      loginController.password.value.isNotEmpty
                                  ? colorsController.blueColor
                                  : colorsController.grayColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              "Login",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        )),
                    const SizedBox(height: 16),

                    // Google login button
                    GestureDetector(
                      onTap: loginController.loginWithGoogle,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: colorsController.blueColor),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/logo/google.png',
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Login with Google",
                              style: TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Register link
                    TextButton(
                      onPressed: () {
                        Get.to(() => const RegisterView());
                      },
                      child: const Text("Don't have an account? Register"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
