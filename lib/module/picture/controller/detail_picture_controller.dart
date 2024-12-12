import 'package:get/get.dart';
import 'package:dio/dio.dart';

class DetailPictureController extends GetxController {
  var pictureDetail = {}.obs;
  var isLoading = false.obs;
  final Dio _dio = Dio();

  void fetchPictureDetail(String id) async {
    isLoading.value = true;
    try {
       final int pictureId = int.parse(id);
      final response = await _dio.get('https://picsum.photos/id/$pictureId/info');
      pictureDetail.value = response.data;
      
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch picture details');
    } finally {
      isLoading.value = false;
    }
  }
}
