// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:marengoo/constants/size_cons.dart';
import 'package:marengoo/controllers/product_controller.dart';
import 'package:get/get.dart';
import 'package:marengoo/models/product_model.dart';
import 'package:marengoo/widgets/product_item_widget.dart';

class GridProductList extends StatelessWidget {
  const GridProductList({
    Key? key,
    required this.productController,
  }) : super(key: key);

  final ProductController productController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return productController.isLoading.value == false
          ? Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.only(
                    left: Sizes.dimen_14,
                    right: Sizes.dimen_14,
                    top: Sizes.dimen_14),
                shrinkWrap: true,
                primary: true,
                itemCount: productController.products.length,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: Sizes.dimen_270,
                    crossAxisSpacing: Sizes.dimen_10,
                    mainAxisSpacing: Sizes.dimen_10,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  ProductModel item = productController.products[index];
                  return ProductItem(item: item);
                }),
          )
          : const Center(
              child: CircularProgressIndicator(),
            );
    });
  }
}
