// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:marengoo/constants/app_color.dart';
import 'package:marengoo/constants/size_cons.dart';
import 'package:marengoo/controllers/cart_controller.dart';
import 'package:marengoo/models/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:marengoo/widgets/text_widget.dart';
import 'package:get/get.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ProductModel item;

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());
    return Container(
      padding: const EdgeInsets.only(bottom: Sizes.dimen_16),
      margin: const EdgeInsets.only(top: Sizes.dimen_32, right: Sizes.dimen_14),
      height: Sizes.dimen_320,
      width: Sizes.dimen_200,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(Sizes.dimen_32)),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Sizes.dimen_20),
                    color: AppColor.highlightColor,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: item.image,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => const CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: Sizes.dimen_10,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              const SizedBox(
                height: Sizes.dimen_14,
              ),
              TextWidget(
                title: item.title,
                weight: FontWeight.bold,
                size: Sizes.dimen_16,
              ),
              TextLtdWidget(
                title: "Rs.${item.price}",
                weight: FontWeight.bold,
                size: Sizes.dimen_14,
                line: 2,
              )
            ],
          ),
          Positioned(
            right: Sizes.dimen_8,
            top: Sizes.dimen_8,
            child: IconButton(
                splashRadius: Sizes.dimen_20,
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_outline,
                  color: AppColor.bgColor,
                )),
          ),
          Positioned(
            right: Sizes.dimen_8,
            bottom: Sizes.dimen_26,
            child: IconButton(
                splashRadius: Sizes.dimen_20,
                onPressed: () {
                  cartController.addToCart(item);
                },
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: AppColor.orangeColor,
                )),
          )
        ],
      ),
    );
  }
}
