import 'package:flutter/material.dart';
import 'restaurant_screen.dart'; // Import Restaurant Screen
import 'profile_screen.dart'; // Import Profile Screen

class LoyaltyProgramsPage extends StatefulWidget {
  const LoyaltyProgramsPage({super.key});

  @override
  _LoyaltyProgramsPageState createState() => _LoyaltyProgramsPageState();
}

class _LoyaltyProgramsPageState extends State<LoyaltyProgramsPage> {
  // Function to handle bottom navigation
  void _onItemTapped(int index) {
    if (index == 0) {
      // Stay on LoyaltyProgramsPage (Home)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoyaltyProgramsPage()),
      );
    } else if (index == 2) {
      print("Scan button tapped");
      // Implement QR scan functionality here in the future
    } else if (index == 3) {
      // Navigate to Restaurant Screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const RestaurantScreen()),
      );
    } else if (index == 4) {
      // Navigate to Profile Screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()),
      );
    } else {
      print("Navigation item $index tapped");
    }
  }

  static const List<String> foodImages = [
    'assets/images/meat-dish.jpg',
    'assets/images/soup.jpg',
    'assets/images/fried-potato.jpg',
    'assets/images/thai-food.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Loyalty Programs",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: foodImages.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      foodImages[index],
                      width: double.infinity,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar with Fixed Icons
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Set active tab to Home (Loyalty Screen)
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30), // Home Icon
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.local_cafe, size: 30),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.qr_code_scanner, color: Colors.white, size: 28),
            ),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu, size: 30), // Fork & Spoon Icon
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30), // Profile Icon
            label: "",
          ),
        ],
      ),
    );
  }
}
