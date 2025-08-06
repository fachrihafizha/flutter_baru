import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'auth/login_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = AuthService.currentUser;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2193b0), Color(0xFF6dd5ed)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
                    },
                    child: const CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, color: Colors.blue),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Hi, ${user?.username ?? "User"} 👋',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      AuthService.logout();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
                    },
                    icon: const Icon(Icons.logout, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard({required IconData icon, required String title, required VoidCallback onTap}) {
    return Material(
      color: Colors.white.withOpacity(0.9),
      elevation: 5,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 36, color: Colors.blue),
              const SizedBox(height: 10),
              Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
