import 'package:get/get.dart';
import 'package:image_list/routes/app_routes.dart';
import '../module/picture/view/detail_picture_view.dart';
import '../module/picture/view/list_picture_view.dart';
import '../module/picture/binding/picture_binding.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.listPictures,
      page: () => ListPictureView(),
      binding: PictureBinding(),
    ),
    GetPage(
      name: AppRoutes.detailPicture,
      page: () => DetailPictureView(),
      binding: PictureBinding(),
    ),
  ];
}
