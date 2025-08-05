import 'package:flutter/material.dart';
import 'package:flutter_fachri/models/post_model.dart';
import 'package:flutter_fachri/servis/post_service.dart';

class ListPostScreen extends StatelessWidget {
  const ListPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Post'),
      ),
      body: FutureBuilder<List<PostModel>>(
        future: PostService.ListAlbum(),
        builder: (context, snapshot) {
          // Menunggu data
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Jika ada error
          if (snapshot.hasError) {
            return Center(child: Text('Terjadi kesalahan: ${snapshot.error}'));
          }

          // Jika data berhasil didapat
          if (snapshot.hasData) {
            final posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  leading: CircleAvatar(child: Text(post.id.toString())),
                  title: Text(post.title),
                  subtitle: Text(post.body),
                );
              },
            );
          }

          // Default jika data kosong
          return const Center(child: Text('Tidak ada data'));
        },
      ),
    );
  }
}
