import 'package:flutter/material.dart';
import 'restaurantdetails_screen.dart'; // Review screen
import 'food_screen.dart'; // Food screen
import "restaurant_screen.dart";
import 'book_table_screen.dart'; // ✅ Add this import

class RestaurantDetailsTab extends StatelessWidget {
  final String restaurantName;
  final String restaurantImage;
  final String restaurantLogo;
  final String restaurantDescription;

  const RestaurantDetailsTab({
    super.key,
    required this.restaurantName,
    required this.restaurantImage,
    required this.restaurantLogo,
    required this.restaurantDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                restaurantImage,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 40,
                left: 20,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const RestaurantScreen()),
                        (route) => false,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),

          // Tab Navigation
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RestaurantDetailScreen(
                          restaurantName: restaurantName,
                          restaurantImage: restaurantImage,
                          restaurantLogo: restaurantLogo,
                          restaurantDescription: restaurantDescription,
                        ),
                      ),
                    );
                  },
                  child: const Text("Review", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodMenuPage(
                          restaurantName: restaurantName,
                          restaurantImage: restaurantImage,
                          restaurantLogo: restaurantLogo,
                          restaurantDescription: restaurantDescription,
                        ),
                      ),
                    );
                  },
                  child: const Text("Food", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                const Text("Details", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const Divider(thickness: 1),

          // Restaurant Info
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurantName,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  restaurantDescription,
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ),
          ),

          const Spacer(),

          // Book Table Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BookTableScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text("Book Table", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
