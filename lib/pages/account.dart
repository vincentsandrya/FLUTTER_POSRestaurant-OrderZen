import 'package:flutter/material.dart';
import 'package:flutter_posrestaurant_orderzen/routes/app_routes_named.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                Container(
                  height: 128,
                  width: double.infinity,
                  color: Color(0xff578FCA),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Account Page',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Row(
                        children: const [
                          Icon(Icons.message, color: Colors.white),
                          SizedBox(width: 16),
                          Icon(Icons.notifications, color: Colors.white),
                        ],
                      ),
                    ],
                  ),
                ),

                Positioned(
                  top: 100,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/profil.JPG'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                children: [
                  Center(
                    child: Text(
                      "Vincent Sandrya",
                      style: TextStyle(fontSize: 20, color: Color(0xff578FCA)),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Software Engineer",
                      style: TextStyle(fontSize: 16, color: Color(0xff578FCA)),
                    ),
                  ),
                  SizedBox(height: 12),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Border radius
                      side: BorderSide(
                        color: Colors.grey[300]!,
                      ), // Border color
                    ),
                    child: ExpansionTile(
                      leading: Icon(Icons.code, color: Colors.blue),
                      title: Text(
                        'Tech Stack',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff578FCA),
                        ),
                      ),
                      subtitle: Text(
                        'View my core competencies',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xff578FCA),
                        ),
                      ),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _expansionChild(FontAwesomeIcons.google, 'Go'),
                            _expansionChild(FontAwesomeIcons.react, 'React'),
                            _expansionChild(
                              FontAwesomeIcons.mobileScreen,
                              'Flutter',
                            ),
                          ],
                        ),
                        SizedBox(height: 12), // Additional spacing
                      ],
                    ),
                  ),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Border radius
                      side: BorderSide(
                        color: Colors.grey[300]!,
                      ), // Border color
                    ),
                    child: ExpansionTile(
                      leading: Icon(Icons.connect_without_contact, color: Colors.blue),
                      title: Text(
                        "Let's Connect",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff578FCA),
                        ),
                      ),
                      subtitle: Text(
                        'Happy to connect or collaborate',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xff578FCA),
                        ),
                      ),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _expansionChild(
                              FontAwesomeIcons.linkedin,
                              'Linkedin',
                            ),
                            _expansionChild(FontAwesomeIcons.whatsapp, 'WA'),
                            _expansionChild(FontAwesomeIcons.envelope, 'Email'),
                          ],
                        ),
                        SizedBox(height: 12), // Additional spacing
                      ],
                    ),
                  ),
                  SizedBox(height: 100),
                  Center(
                    child: InkWell(
                      onTap: () => {},
                      child: Text(
                        "Change Password",
                        style: TextStyle(color: Color(0xffFADA7A)),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    height: 52,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: Colors.white70,
                      ),
                      onPressed: () =>
                          Get.offAllNamed(AppRoutesNamed.getStartedPage),
                      child: Text(
                        "Logout",
                        style: TextStyle(color: Color(0xff578FCA)),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Center(child: Text("App Version v1.0.1")),
                  SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _expansionChild(IconData icon, String text) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          SizedBox(height: 12),
          FaIcon(icon, size: 36, color: Color(0xff578FCA)),
          SizedBox(height: 12),
          Text(text, style: TextStyle(fontSize: 16, color: Color(0xff578FCA))),
        ],
      ),
    );
  }

  //   Widget _buildContactItem(IconData icon, String text, {VoidCallback? onTap}) {
  //     return ListTile(
  //       leading: icon == Icons.email
  //           ? Icon(icon, size: 24)
  //           : FaIcon(icon, size: 24),
  //       title: Text(text),
  //       onTap: onTap,
  //       trailing: Icon(Icons.arrow_outward, size: 16), // External link indicator
  //     );
  //   }
}
