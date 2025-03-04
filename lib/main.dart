import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants/theme.dart';
import 'screens/main_layout.dart';
import 'screens/category_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'OLX Clone',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => MainLayout()),
        GetPage(
          name: '/category/:category',
          page: () => CategoryView(
            category: Get.parameters['category'] ?? 'All',
          ),
        ),
      ],
      home: MainLayout(),
    );
  }
}