import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marengoo/constants/size_cons.dart';
import 'package:marengoo/controllers/product_controller.dart';
import 'package:marengoo/models/product_model.dart';
import 'package:marengoo/widgets/product_item_widget.dart';
class HorizontalProductList extends StatelessWidget {
  const HorizontalProductList({
    Key? key,
    required this.productController,
  }) : super(key: key);

  final ProductController productController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Sizes.dimen_320,
      child: Obx((() => productController.isLoading.value == false
          ? ListView.builder(
              padding: const EdgeInsets.only(
                  left: Sizes.dimen_14, right: Sizes.dimen_14),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: productController.products.length,
              itemBuilder: (context, index) {
                ProductModel item = productController.products[index];
                return ProductItem(item: item);
              })
          : const Center(
              child: CircularProgressIndicator(),
            ))),
    );
  }
}

