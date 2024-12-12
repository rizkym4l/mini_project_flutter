import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/detail_picture_controller.dart';
import '../../../shared/widget/loading_widget.dart';

class DetailPictureView extends StatelessWidget {
  final DetailPictureController controller = Get.put(DetailPictureController());

  @override
  Widget build(BuildContext context) {
    final id = Get.arguments ;
    controller.fetchPictureDetail(id);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Picture Detail'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: LoadingWidget());
        }
        final pictureDetail = controller.pictureDetail.value;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                pictureDetail['download_url'],
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'by ${pictureDetail['author']}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      }),
    );
  }
}
