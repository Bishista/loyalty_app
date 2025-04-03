import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class UserQRCodeScreen extends StatelessWidget {
  final String phoneNumber;

  const UserQRCodeScreen({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My QR Code"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(
              data: phoneNumber, // This makes QR unique to each user
              version: QrVersions.auto,
              size: 250.0,
              backgroundColor: Colors.white,
            ),
            const SizedBox(height: 20),
            Text(
              "Phone: $phoneNumber",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text("Scan this code to earn loyalty stamps"),
          ],
        ),
      ),
    );
  }
}
