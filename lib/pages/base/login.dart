// import 'package:flutter/cupertino.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_posrestaurant_orderzen/controller/auth_controller.dart';
// import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_posrestaurant_orderzen/routes/app_routes_named.dart';
import 'package:flutter_posrestaurant_orderzen/modules/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() {
          if (authController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Padding(
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
                  SizedBox(height: 80),
                  CustomTextFormField(
                    label: "Masukkan email",
                    onChanged: (val) => authController.email.value = val,
                  ),
                  CustomTextFormField(
                    label: "Password",
                    onChanged: (val) => authController.password.value = val,
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Text('Belum punya akun? '),
                      InkWell(
                        onTap: () {
                          Get.offAllNamed(AppRoutesNamed.registerPage);
                        },
                        child: Text(
                          ' daftar',
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
                          : () => authController.login(),
                      child: authController.isLoading.value
                          ? CircularProgressIndicator()
                          : Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                    ),
                  ),
                  SizedBox(height: 86),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}

// class CustomTextFormField extends StatelessWidget {
//   const CustomTextFormField({
//     super.key,
//     required this.label,
//     required this.onChanged,
//   });

//   final String label;
//   final Function(String) onChanged;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 25),
//       child: TextFormField(
//         onChanged: onChanged,
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
