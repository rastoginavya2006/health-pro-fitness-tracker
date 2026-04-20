import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile (Stateful)')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _isFavorited ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
              size: 50,
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _isFavorited = !_isFavorited; // Toggles the heart icon
                });
              },
              child: Text(_isFavorited ? 'Remove from Favorites' : 'Add to Favorites'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}