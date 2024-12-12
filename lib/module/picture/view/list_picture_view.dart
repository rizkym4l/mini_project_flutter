import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/list_picture_controller.dart';
import '../../../shared/widget/loading_widget.dart';

class ListPictureView extends StatelessWidget {
  final ListPictureController controller = Get.put(ListPictureController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Picture List'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: LoadingWidget());
        }
        return ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: controller.pictureList.length,
          itemBuilder: (context, index) {
            final picture = controller.pictureList[index];
            return GestureDetector(
              onTap: () {
                Get.toNamed('/detail-picture', arguments: picture['id']);
              },
              child: Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Image.network(
                        picture['download_url'],
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
                        'by ${picture['author']}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
