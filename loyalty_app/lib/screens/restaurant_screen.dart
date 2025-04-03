import 'package:flutter/material.dart';
import 'loyalty_screen.dart';
import 'profile_screen.dart';
import 'restaurantdetails_screen.dart';
import 'myrewards_screen.dart'; // ✅ Added import

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key});

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoyaltyProgramsPage()),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyRewardsScreen()), // ✅ Navigate to Rewards
      );
    } else if (index == 2) {
      print("Scan button tapped");
    } else if (index == 3) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const RestaurantScreen()),
      );
    } else if (index == 4) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()),
      );
    }
  }

  static const List<Map<String, String>> restaurants = [
    {
      "image": "assets/images/res6.jpg",
      "name": "Pasta Palace",
      "logo": "assets/images/res6.jpg",
      "description": "Handmade pasta & Italian classics.",
    },
    {
      "image": "assets/images/res2.jpg",
      "name": "Salad Stop",
      "logo": "assets/images/res2.jpg",
      "description": "Fresh, healthy, and delicious salads.",
    },
    {
      "image": "assets/images/res3.jpg",
      "name": "Sweet Treats",
      "logo": "assets/images/res3.jpg",
      "description": "Cakes, pastries, and dessert dreams.",
    },
    {
      "image": "assets/images/res4.jpg",
      "name": "Thirsty Owl",
      "logo": "assets/images/res4.jpg",
      "description": "Mocktails and smoothies galore!",
    },
    {
      "image": "assets/images/res5.jpg",
      "name": "Momo Magic",
      "logo": "assets/images/res5.jpg",
      "description": "Tibetan-style momos and sauces.",
    },
    {
      "image": "assets/images/res6.jpg",
      "name": "Pizza Planet",
      "logo": "assets/images/res6.jpg",
      "description": "Cheesy, crispy, heavenly pizzas.",
    },
  ];

  static const List<String> categories = [
    "Pasta",
    "Salad",
    "Dessert",
    "Drinks",
    "Momo",
    "Pizza",
    "Burger",
    "Sushi",
    "Tacos",
    "Steak"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Restaurants",
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

          // Category Filter Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: categories.map((category) {
                return _buildCategoryButton(category);
              }).toList(),
            ),
          ),

          // Restaurant Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                final restaurant = restaurants[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RestaurantDetailScreen(
                          restaurantName: restaurant["name"]!,
                          restaurantImage: restaurant["image"]!,
                          restaurantLogo: restaurant["logo"]!,
                          restaurantDescription: restaurant["description"]!,
                        ),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      restaurant["image"]!,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), label: ""),
          const BottomNavigationBarItem(icon: Icon(Icons.local_cafe, size: 30), label: ""), // ✅ Rewards
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
              child: const Icon(Icons.qr_code_scanner, color: Colors.white, size: 28),
            ),
            label: "",
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu, size: 30), label: ""),
          const BottomNavigationBarItem(icon: Icon(Icons.person, size: 30), label: ""),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }
}
