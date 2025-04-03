import 'package:flutter/material.dart';
import 'food_screen.dart';
import 'details_screen.dart';
import 'restaurant_screen.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final String restaurantName;
  final String restaurantImage;
  final String restaurantLogo;
  final String restaurantDescription;

  const RestaurantDetailScreen({
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Cover Image with Back Button
              Stack(
                children: [
                  Image.asset(
                    restaurantImage,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.6),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                           Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const RestaurantScreen()),
                          (route) => false,
                           );
                        }
                      ),
                    ),
                  ),
                ],
              ),
              // Tabs
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Review", style: TextStyle(fontWeight: FontWeight.bold)),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RestaurantDetailsTab(
                              restaurantName: restaurantName,
                              restaurantImage: restaurantImage,
                              restaurantLogo: restaurantLogo,
                              restaurantDescription: restaurantDescription,
                            ),
                          ),
                        );
                      },
                      child: const Text("Details", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 1),
              // Info
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(restaurantLogo),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurantName,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: List.generate(
                            5,
                            (index) => const Icon(Icons.star_border, color: Colors.grey),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              // Description
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    restaurantDescription,
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                ),
                child: const Text("Send", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
