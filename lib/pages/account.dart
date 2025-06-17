import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                          fontSize: 14,
                          color: Color(0xff578FCA),
                        ),
                      ),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildTechItem(FontAwesomeIcons.google, 'Go'),
                            _buildTechItem(FontAwesomeIcons.react, 'React'),
                            _buildTechItem(
                              FontAwesomeIcons.mobileScreen,
                              'Flutter',
                            ),
                          ],
                        ),
                        SizedBox(height: 12), // Additional spacing
                      ],
                    ),
                  ),
                  // ExpansionTile(
                  //   title: Text('Section 2'),
                  //   leading: Icon(Icons.settings),
                  //   children: [
                  //     ListTile(title: Text('Details for Section 2')),
                  //   ],
                  // ),
                  // ExpansionTile(
                  //   title: Text('Section 3'),
                  //   leading: Icon(Icons.help),
                  //   children: [
                  //     ListTile(title: Text('Details for Section 3')),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTechItem(IconData icon, String text) {
    return SizedBox(
      width: 120,
      child: Column(
        children: [
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
