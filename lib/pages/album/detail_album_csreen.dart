
import 'package:flutter/material.dart';

class AlbumDetailScreen extends StatelessWidget {
  final String userId;
  final String id;
  final String title;

  AlbumDetailScreen({
    required this.userId,
    required this.id,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(userId!, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Text(id!, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Text(title!, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}