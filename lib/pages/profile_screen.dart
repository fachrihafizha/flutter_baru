import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = AuthService.currentUser;

    return Scaffold(
      appBar: AppBar(title: const Text("Profil")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const CircleAvatar(radius: 40, backgroundColor: Colors.blue),
            const SizedBox(height: 16),
            Text(user?.username ?? 'No Name', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(user?.email ?? '-', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
