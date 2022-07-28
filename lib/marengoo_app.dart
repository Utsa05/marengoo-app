// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marengoo/constants/app_color.dart';
import 'package:marengoo/views/bottom_navigation/bottom_navigation_bar.dart';

class MarengooApp extends StatelessWidget {
  const MarengooApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          primaryColor: AppColor.titleColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: AppColor.bgColor,
          appBarTheme: const AppBarTheme(
              backgroundColor: AppColor.bgColor, elevation: 0.0)),
      debugShowCheckedModeBanner: false,
      home: const BottomNavBarView(),
    );
  }
}
