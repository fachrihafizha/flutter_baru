import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import '../home_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _error;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    final success = await AuthService.login(
      _usernameController.text,
      _passwordController.text,
    );

    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } else {
      setState(() {
        _error = 'Login gagal. Coba lagi!';
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
              const Text("Login", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              TextField(controller: _usernameController, decoration: const InputDecoration(labelText: 'Username')),
              const SizedBox(height: 12),
              TextField(controller: _passwordController, obscureText: true, decoration: const InputDecoration(labelText: 'Password')),
              if (_error != null) ...[
                const SizedBox(height: 12),
                Text(_error!, style: const TextStyle(color: Colors.red)),
              ],
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isLoading ? null : _login,
                child: _isLoading ? const CircularProgressIndicator() : const Text("Login"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const RegisterScreen()));
                },
                child: const Text("Belum punya akun? Register"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
