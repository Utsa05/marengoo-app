import 'package:flutter/material.dart';
import 'package:marengoo/constants/app_color.dart';
import 'package:marengoo/controllers/cart_controller.dart';
import 'package:marengoo/widgets/cart_item_widget.dart';
import 'package:get/get.dart';
import 'package:marengoo/widgets/text_widget.dart';

class CartList extends StatelessWidget {
  const CartList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());

    return Obx(() => cartController.cartProducts.isNotEmpty
        ? ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: cartController.cartProducts.length,
            itemBuilder: (context, index) {
              return CartItem(
                item: cartController.cartProducts[index],
                cartController: cartController,
              );
            })
        : const Center(
            child: TextWidget(
              title: "Cart Empty",
              color: AppColor.titleColor,
            ),
          ));
  }
}
