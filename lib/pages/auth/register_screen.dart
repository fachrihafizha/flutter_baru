import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import '../home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _error;

  Future<void> _register() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    final success = await AuthService.register(
      _usernameController.text,
      _emailController.text,
      _passwordController.text,
    );

    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } else {
      setState(() {
        _error = 'Gagal register. Coba lagi!';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Register", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              TextField(controller: _usernameController, decoration: const InputDecoration(labelText: 'Username')),
              const SizedBox(height: 12),
              TextField(controller: _emailController, decoration: const InputDecoration(labelText: 'Email')),
              const SizedBox(height: 12),
              TextField(controller: _passwordController, obscureText: true, decoration: const InputDecoration(labelText: 'Password')),
              if (_error != null) ...[
                const SizedBox(height: 12),
                Text(_error!, style: const TextStyle(color: Colors.red)),
              ],
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isLoading ? null : _register,
                child: _isLoading ? const CircularProgressIndicator() : const Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
