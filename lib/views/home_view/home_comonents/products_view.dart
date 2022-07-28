// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:marengoo/constants/size_cons.dart';
import 'package:marengoo/controllers/product_controller.dart';
import 'package:marengoo/models/product_model.dart';
import 'package:get/get.dart';
import 'package:marengoo/views/home_view/home_comonents/grid_product_list.dart';
import 'package:marengoo/views/home_view/home_comonents/horizontal_product_list.dart';

class ProductView extends StatefulWidget {
  const ProductView({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  //call product controller
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            HorizontalProductList(productController: productController),
            GridProductList(productController: productController)
          ],
        ),
      ),
    );
  }
}
