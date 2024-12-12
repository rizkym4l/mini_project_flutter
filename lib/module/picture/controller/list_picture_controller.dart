import 'package:get/get.dart';
import 'package:dio/dio.dart';

class ListPictureController extends GetxController {
  var pictureList = [].obs;
  var isLoading = false.obs;
  final Dio _dio = Dio();

  @override
  void onInit() {
    super.onInit();
    fetchPictures();
  }

  void fetchPictures() async {
    isLoading.value = true;
    try {
      final response = await _dio.get('https://picsum.photos/v2/list');
      pictureList.value = response.data;
       Get.snackbar('Success', 'berhasil');
       (response.data[0]['id']);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch pictures');
    } finally {
      isLoading.value = false;
    }
  }
}
