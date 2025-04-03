import 'package:flutter/material.dart';
import 'restaurantdetails_screen.dart'; // Review tab
import 'details_screen.dart'; // Details tab
import 'restaurant_screen.dart';
import 'book_table_screen.dart'; // ✅ Import Book Table Screen

class FoodMenuPage extends StatelessWidget {
  final String restaurantName;
  final String restaurantImage;
  final String restaurantLogo;
  final String restaurantDescription;

  const FoodMenuPage({
    super.key,
    required this.restaurantName,
    required this.restaurantImage,
    required this.restaurantLogo,
    required this.restaurantDescription,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> foodItems = [
      {
        "name": "Pasta",
        "image": "assets/images/reslogo1.jpg",
        "price": "Rs 350"
      },
      {
        "name": "Cereal",
        "image": "assets/images/reslogo2.jpg",
        "price": "Rs 350"
      },
      {
        "name": "Noodles",
        "image": "assets/images/reslogo3.jpg",
        "price": "Rs 350"
      },
      {
        "name": "Salad",
        "image": "assets/images/reslogo4.jpg",
        "price": "Rs 350"
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.asset(
                  restaurantImage,
                  fit: BoxFit.cover,
                ),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                  child: const Text("Review", style: TextStyle(fontWeight: FontWeight.w500)),
                ),
                const Text("Food", style: TextStyle(fontWeight: FontWeight.w500)),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
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
                  child: const Text("Details", style: TextStyle(fontWeight: FontWeight.w500)),
                ),
              ],
            ),
          ),
          const Divider(thickness: 1),
          Expanded(
            child: ListView.builder(
              itemCount: foodItems.length,
              itemBuilder: (context, index) {
                final item = foodItems[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          item["image"]!,
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item["name"]!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            const Text("Incredients", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                      Text(item["price"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[700],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BookTableScreen()),
                );
              },
              child: const Text("Book Table", style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
          // 🧹 Navigation bar removed here
        ],
      ),
    );
  }
}
