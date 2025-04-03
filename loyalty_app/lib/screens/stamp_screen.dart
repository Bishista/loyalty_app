import 'package:flutter/material.dart';

class StampScreen extends StatelessWidget {
  final String loyaltyProgramName;
  final int currentStamps;
  final int maxStamps;

  const StampScreen({
    super.key,
    required this.loyaltyProgramName,
    required this.currentStamps,
    required this.maxStamps,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top Image + Back Button
          Stack(
            children: [
              Image.asset(
                'assets/food.png', // Ensure this image exists in assets
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 20,
                left: 10,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, size: 30, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const Positioned(
                top: 20,
                right: 10,
                child: Icon(Icons.menu, size: 30, color: Colors.white),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Loyalty Program Name
          Text(
            loyaltyProgramName,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          // Stamps Grid
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: maxStamps,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (context, index) {
                bool isFilled = index < currentStamps;
                return CircleAvatar(
                  radius: 25, // Smaller stamp size
                  backgroundColor: isFilled ? Colors.green : Colors.grey[300],
                  child: isFilled
                      ? Image.asset('assets/reward1.png', width: 30, height: 30) // Stamp image
                      : const Icon(Icons.add, size: 18, color: Colors.grey), // Empty stamp
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          // Save Button
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              ),
              child: const Text(
                "Save",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
