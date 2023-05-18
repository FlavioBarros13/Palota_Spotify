import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/features/controllers/categoriesController.dart';
import 'package:flutter_spotify_africa_assessment/routes.dart';
import 'package:get/get.dart';


void main() {
  runApp(const PalotaAssessmentApp());
  Get.put(CategoriesController());
}

class PalotaAssessmentApp extends StatelessWidget {
  const PalotaAssessmentApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Palota Spotify Africa Assessment',
      theme: ThemeData.dark(useMaterial3: true),
      initialRoute: AppRoutes.startUp,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
