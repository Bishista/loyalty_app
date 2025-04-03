import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YourProfileScreen extends StatefulWidget {
  const YourProfileScreen({super.key});

  @override
  State<YourProfileScreen> createState() => _YourProfileScreenState();
}

class _YourProfileScreenState extends State<YourProfileScreen> {
  File? _imageFile;
  String userName = "Bishista Bajracharya";
  String? phoneNumber;

  @override
  void initState() {
    super.initState();
    _loadUserPhoneNumber();
    _loadSavedImage();
  }

  Future<void> _loadUserPhoneNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() => phoneNumber = prefs.getString('phone_number'));
  }

  Future<void> _loadSavedImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imagePath = prefs.getString('profile_image');
    if (imagePath != null) {
      setState(() => _imageFile = File(imagePath));
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => _imageFile = File(pickedFile.path));
    }
  }

  Future<void> _saveProfileImage() async {
    if (_imageFile == null) return;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_image', _imageFile!.path);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profile picture saved successfully")),
    );

    Navigator.pop(context); // Return to profile screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Profile"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: _imageFile != null
                      ? FileImage(_imageFile!)
                      : const AssetImage("assets/images/profile.jpg") as ImageProvider,
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.edit, color: Colors.white, size: 20),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              userName,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            if (phoneNumber != null) ...[
              const SizedBox(height: 8),
              Text(phoneNumber!, style: const TextStyle(color: Colors.grey)),
            ],
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text("Change Profile Picture"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveProfileImage,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text("Save", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
