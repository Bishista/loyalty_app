import 'package:flutter/material.dart';
import 'loyalty_screen.dart';
import 'restaurant_screen.dart';
import 'profile_screen.dart';

class MyRewardsScreen extends StatefulWidget {
  const MyRewardsScreen({super.key});

  @override
  State<MyRewardsScreen> createState() => _MyRewardsScreenState();
}

class _MyRewardsScreenState extends State<MyRewardsScreen> {
  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoyaltyProgramsPage()));
    } else if (index == 2) {
      print("Scan button tapped");
    } else if (index == 3) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const RestaurantScreen()));
    } else if (index == 4) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()));
    }
  }

  final List<Map<String, String>> rewards = [
    {
      "image": "assets/images/cupcakes.jpg",
      "name": "Cupcakes",
      "description": "Get a box of sweet vanilla cupcakes!"
    },
    {
      "image": "assets/images/coffee.jpg",
      "name": "Coffee",
      "description": "Enjoy a free cappuccino on your next visit."
    },
    {
      "image": "assets/images/cookies.jpg",
      "name": "Cookies",
      "description": "Claim 3 freshly baked cookies."
    },
    {
      "image": "assets/images/shake.jpg",
      "name": "Milkshake",
      "description": "A large chocolate shake, just for you!"
    },
    {
      "image": "assets/images/mojito.jpg",
      "name": "Mojito",
      "description": "A refreshing mint mojito for hot days."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("My Rewards"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const RestaurantScreen()),
            );
          },
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          const Icon(Icons.emoji_events, size: 60, color: Colors.black),
          const SizedBox(height: 10),
          const Text("My Rewards",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 30),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: rewards.length,
              separatorBuilder: (_, __) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                final reward = rewards[index];
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(reward["image"]!),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            reward["name"]!,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            reward["description"]!,
                            style: const TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), label: ""),
          const BottomNavigationBarItem(icon: Icon(Icons.local_cafe, size: 30), label: ""),
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
}
