// import 'package:flutter/cupertino.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_posrestaurant_orderzen/controller/auth_controller.dart';
import 'package:flutter_posrestaurant_orderzen/modules/custom_text_field.dart';
// import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_posrestaurant_orderzen/routes/app_routes_named.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 41),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 200),
                width: double.infinity,
                height: 146,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Logo.png'),
                  ),
                ),
              ),
              Spacer(),
              CustomTextFormField(
                label: "Nama lengkap",
                onChanged: (val) => authController.email.value = val,
              ),
              CustomTextFormField(
                label: "Email",
                onChanged: (val) => authController.email.value = val,
              ),
              CustomTextFormField(
                label: "Password",
                onChanged: (val) => authController.email.value = val,
              ),
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Text('Sudah punya akun? '),
                  InkWell(
                    onTap: () {
                      Get.offAllNamed(AppRoutesNamed.loginPage);
                    },
                    child: Text(
                      ' masuk',
                      style: TextStyle(color: Color(0xff3498DB)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 64),
              SizedBox(
                height: 52,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: Color(0xff3498DB),
                  ),
                  onPressed: authController.isLoading.value
                      ? null
                      : () => authController.register(),
                  child: authController.isLoading.value
                      ? CircularProgressIndicator()
                      : Text("Sign Up", style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(height: 86),
            ],
          ),
        ),
      ),
    );
  }
}

// class CustomTextFormField extends StatelessWidget {
//   const CustomTextFormField({
//     super.key,
//     required this.controller,
//     required this.label,
//   });

//   final TextEditingController controller;
//   final String label;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 25),
//       child: TextFormField(
//         controller: controller,
//         decoration: InputDecoration(
//           label: Text(label, style: TextStyle(color: Color(0xffC0C0C0))),
//           border: OutlineInputBorder(
//             borderSide: BorderSide(color: Color(0xffC0C0C0)),
//           ),
//         ),
//       ),
//     );
//   }
// }
