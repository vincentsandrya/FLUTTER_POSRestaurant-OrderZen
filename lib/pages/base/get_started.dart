import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter_posrestaurant_orderzen/routes/app_routes_named.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 41),
          child: Column(
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
              SizedBox(
                height: 52,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed(AppRoutesNamed.loginPage);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff578FCA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: GoogleFonts.arimo(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: Divider(color: Color(0xffC0C0C0), height: 3)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Or',
                      style: TextStyle(color: Color(0xffC0C0C0)),
                    ),
                  ),
                  Expanded(child: Divider(color: Color(0xffC0C0C0), height: 3)),
                ],
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 52,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed(AppRoutesNamed.registerPage);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffFADA7A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.arimo(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
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
