import 'package:dio/dio.dart';

class PictureService {
  final Dio _dio = Dio();

  // Fetch list of images
  Future<List<dynamic>> fetchPictures() async {
    try {
      final response = await _dio.get('https://picsum.photos/v2/list');
      return response.data;
    } catch (e) {
      throw Exception('Failed to load pictures');
    }
  }

  // Fetch detail of a specific image
  Future<Map<String, dynamic>> fetchPictureDetail(int id) async {
    print(id);
    try {
      final response = await _dio.get('https://picsum.photos/id/$id/info');
      return response.data;
    } catch (e) {
      throw Exception('Failed to load picture detail');
    }
  }
}
