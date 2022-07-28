import 'package:flutter/material.dart';
import 'package:marengoo/constants/app_color.dart';
import 'package:marengoo/constants/size_cons.dart';
import 'package:marengoo/constants/string_cons.dart';
import 'package:marengoo/views/cart_view/cart_view.dart';
import 'package:marengoo/widgets/text_widget.dart';
import 'package:get/get.dart';

AppBar homeAppbar() {
  return AppBar(
    
    toolbarHeight: Sizes.dimen_64 + Sizes.dimen_12,
    title: TextWidget(
      title: StringCons.appName.toUpperCase(),
      size: Sizes.dimen_20,
      weight: FontWeight.bold,
    ),
    actions: [
      Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(right: Sizes.dimen_14),
        height: Sizes.dimen_32,
        width: Sizes.dimen_40,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            InkWell(
              onTap: () {
                Get.to(const CartView());
              },
              child: const Icon(
                Icons.shopping_cart,
                color: AppColor.titleColor,
                size: Sizes.dimen_26,
              ),
            ),
            Positioned(
              right: -Sizes.dimen_1,
              child: Container(
                height: Sizes.dimen_12,
                width: Sizes.dimen_12,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppColor.orangeColor),
              ),
            )
          ],
        ),
      ),
    ],
  );
}
