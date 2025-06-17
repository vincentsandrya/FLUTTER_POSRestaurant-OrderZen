import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 280,
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
                        'Welcome',
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
                  left: 16,
                  right: 16,
                  child: Container(
                    height: 170,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/banner.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildMenuButton(
                icon: Icons.shopping_basket,
                label: 'Pickup',
                onTap: () => print('Pickup tapped'),
              ),
              _buildMenuButton(
                icon: Icons.delivery_dining,
                label: 'Delivery',
                onTap: () => print('Delivery tapped'),
              ),
              _buildMenuButton(
                icon: Icons.history,
                label: 'History',
                onTap: () => print('History tapped'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildMenuButton({
  required IconData icon,
  required String label,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 34, color: Colors.blue[700]),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}
