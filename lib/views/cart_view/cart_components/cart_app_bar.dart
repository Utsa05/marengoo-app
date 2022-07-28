// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:marengoo/constants/app_color.dart';
import 'package:marengoo/constants/size_cons.dart';
import 'package:marengoo/constants/string_cons.dart';
import 'package:marengoo/controllers/cart_controller.dart';
import 'package:marengoo/widgets/text_widget.dart';
import 'package:get/get.dart';

AppBar cartAppBar() {
  final CartController cartController = Get.put(CartController());
  return AppBar(
    automaticallyImplyLeading: false,
    toolbarHeight: Sizes.dimen_80,
    title: Column(
      children: const [
        TextWidget(
          title: "Your",
          color: AppColor.titleColor,
          weight: FontWeight.bold,
          size: Sizes.dimen_20,
        ),
        TextWidget(
          title: "Cart",
          color: AppColor.titleColor,
          weight: FontWeight.bold,
          size: Sizes.dimen_20,
        ),
      ],
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: Sizes.dimen_16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const TextWidget(
              title: StringCons.paymentAmount,
              color: AppColor.subtitleColor,
              weight: FontWeight.normal,
              size: Sizes.dimen_14 + Sizes.dimen_2,
            ),
            Obx(() => TextWidget(
                  title: "Rs.${cartController.totalAmount.toString()}",
                  color: AppColor.titleColor,
                  weight: FontWeight.bold,
                  size: Sizes.dimen_18,
                ))
          ],
        ),
      )
    ],
  );
}
