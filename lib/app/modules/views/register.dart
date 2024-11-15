import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/app/modules/views/registerController.dart';
import 'package:login_register/app/core/utils/colors.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterController registerController = Get.put(RegisterController());
  final ColorsController colorsController = Get.find<ColorsController>();

  bool _obscureTextPassword = true; // Status untuk password
  bool _obscureTextConfirmPassword = true; // Status untuk konfirmasi password

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Register"),
          backgroundColor: colorsController.blueColor,
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4, // Lebar kontainer
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Image.asset(
                    "assets/logo/kindergarten.png", // Ganti dengan path gambar Anda
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Selamat Datang!",
                    style: TextStyle(
                      fontFamily: "InterBold",
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Form input dengan ikon
                  _buildTextField(
                    icon: Icons.person,
                    label: "Nama Orang Tua",
                    onChanged: registerController.setParentName,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    icon: Icons.email,
                    label: "Email",
                    onChanged: registerController.setEmail,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    icon: Icons.phone,
                    label: "No. Telepon",
                    onChanged: registerController.setPhoneNumber,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    icon: Icons.home,
                    label: "Alamat",
                    onChanged: registerController.setAddress,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    icon: Icons.child_care,
                    label: "Nama Anak",
                    onChanged: registerController.setChildName,
                  ),
                  const SizedBox(height: 16),
                  Obx(() => DropdownButtonFormField<String>(
                        value: registerController.selectedClass.value.isNotEmpty
                            ? registerController.selectedClass.value
                            : null,
                        items: const [
                          DropdownMenuItem(
                            value: "A",
                            child: Text("Kelas A"),
                          ),
                          DropdownMenuItem(
                            value: "B",
                            child: Text("Kelas B"),
                          ),
                          DropdownMenuItem(
                            value: "C",
                            child: Text("Kelas C"),
                          ),
                        ],
                        onChanged: (String? value) {
                          registerController.setSelectedClass(value ?? '');
                        },
                        decoration: const InputDecoration(
                          labelText: "Kelas Anak",
                          border: OutlineInputBorder(),
                        ),
                      )),
                  const SizedBox(height: 16),
                  // Password Field
                  TextField(
                    onChanged: registerController.setPassword,
                    obscureText: _obscureTextPassword,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureTextPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureTextPassword =
                                !_obscureTextPassword; // Toggle visibility
                          });
                        },
                      ),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Confirm Password Field
                  TextField(
                    onChanged: registerController.setConfirmPassword,
                    obscureText: _obscureTextConfirmPassword,
                    decoration: InputDecoration(
                      labelText: "Konfirmasi Password",
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureTextConfirmPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureTextConfirmPassword =
                                !_obscureTextConfirmPassword; // Toggle visibility
                          });
                        },
                      ),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Obx(() => CheckboxListTile(
                        title: const Text("Saya setuju dengan persyaratan"),
                        value: registerController.agreedToTerms.value,
                        onChanged: (value) =>
                            registerController.setAgreedToTerms(value!),
                        controlAffinity: ListTileControlAffinity.leading,
                      )),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: registerController.register,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: colorsController.blueColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        "Register",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membuat TextField dengan ikon
  Widget _buildTextField({
    required IconData icon,
    required String label,
    required ValueChanged<String> onChanged,
    bool obscureText = false,
  }) {
    return TextField(
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
