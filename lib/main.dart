import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_list/routes/app_routes.dart';
import 'routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.listPictures,
      getPages: AppPages.routes,
    );
  }
}
