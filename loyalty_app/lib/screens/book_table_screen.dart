import 'package:flutter/material.dart';
import 'restaurant_screen.dart'; // For back navigation
import 'bookingdetails_screen.dart'; // Target screen

class BookTableScreen extends StatelessWidget {
  const BookTableScreen({super.key});

  final List<Map<String, dynamic>> tableList = const [
    {"number": 1, "seats": 2, "reserved": false},
    {"number": 2, "seats": 2, "reserved": false},
    {"number": 3, "seats": 2, "reserved": true},
    {"number": 4, "seats": 2, "reserved": false},
    {"number": 5, "seats": 2, "reserved": true},
    {"number": 6, "seats": 2, "reserved": false},
    {"number": 7, "seats": 2, "reserved": false},
    {"number": 8, "seats": 2, "reserved": false},
    {"number": 9, "seats": 2, "reserved": false},
    {"number": 10, "seats": 2, "reserved": false},
    {"number": 11, "seats": 2, "reserved": false},
    {"number": 12, "seats": 2, "reserved": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Back Button
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, size: 30),
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

            // Title
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Select table",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            // Filter buttons (UI placeholder)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(3, (index) {
                  return Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(color: Colors.grey, blurRadius: 4, offset: Offset(2, 2))
                      ],
                    ),
                  );
                }),
              ),
            ),

            // Grid of Tables
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.builder(
                  itemCount: tableList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    final table = tableList[index];
                    final isReserved = table["reserved"] as bool;

                    return GestureDetector(
                      onTap: () {
                        if (!isReserved) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BookingDetailsScreen(),
                            ),
                          );
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isReserved ? Colors.red : Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Table No: ${table['number']}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                            const SizedBox(height: 8),
                            Text("Total Seats: ${table['seats']}",
                                style: const TextStyle(color: Colors.white)),
                            const SizedBox(height: 8),
                            Text(isReserved ? "Reserved" : "Available",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
