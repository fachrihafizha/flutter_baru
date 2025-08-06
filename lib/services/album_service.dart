import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/album_model.dart';

class AlbumService {
  static Future<List<AlbumModel>> listAlbum() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => AlbumModel.fromJson(json)).toList();
    } else {
      throw Exception('Gagal memuat data album');
    }
  }
}
