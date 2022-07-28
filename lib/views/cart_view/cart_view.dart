import 'package:flutter/material.dart';

import 'package:marengoo/views/cart_view/cart_components/bottom_bar_widget.dart';
import 'package:marengoo/views/cart_view/cart_components/cart_app_bar.dart';
import 'package:marengoo/views/cart_view/cart_components/cart_list.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cartAppBar(),
      body: const CartList(),
      bottomNavigationBar: const BottomBarWidget(),
    );
  }
}
