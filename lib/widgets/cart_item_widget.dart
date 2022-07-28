import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:marengoo/constants/app_color.dart';
import 'package:marengoo/constants/size_cons.dart';
import 'package:marengoo/controllers/cart_controller.dart';
import 'package:marengoo/models/product_model.dart';
import 'package:marengoo/widgets/text_widget.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.item,
    required this.cartController,
  }) : super(key: key);

  final ProductModel item;
  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          left: Sizes.dimen_10, right: Sizes.dimen_10, top: Sizes.dimen_10),
      width: double.infinity,
      height: Sizes.dimen_140,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.dimen_10),
            child: Image.network(
              item.image,
              height: Sizes.dimen_130,
              width: 120.0,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: Sizes.dimen_12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  title: item.title,
                  size: Sizes.dimen_18,
                ),
                const SizedBox(
                  height: Sizes.dimen_8,
                ),
                TextWidget(
                  title: "Rs.${item.price}",
                  size: Sizes.dimen_18,
                  weight: FontWeight.bold,
                ),
                const SizedBox(
                  height: Sizes.dimen_8,
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: Sizes.dimen_32,
                      width: Sizes.dimen_32,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(width: 1, color: AppColor.titleColor)),
                      child: const Icon(Icons.money),
                    ),
                    const SizedBox(
                      width: Sizes.dimen_8,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: Sizes.dimen_32,
                      width: Sizes.dimen_32,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.orangeColor.withOpacity(0.3)),
                    )
                  ],
                ),
                const SizedBox(
                  height: Sizes.dimen_8,
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              const TextWidget(
                title: "1x",
                color: AppColor.titleColor,
                size: Sizes.dimen_20,
                weight: FontWeight.w700,
              ),
              const SizedBox(
                height: Sizes.dimen_40,
              ),
              IconButton(
                  onPressed: () {
                    cartController.deleteFromCart(item);
                  },
                  icon: const Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                    size: Sizes.dimen_32,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
