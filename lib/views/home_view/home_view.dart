// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:marengoo/constants/app_color.dart';
import 'package:marengoo/constants/size_cons.dart';
import 'package:marengoo/constants/string_cons.dart';
import 'package:marengoo/controllers/product_controller.dart';
import 'package:marengoo/models/tab_model.dart';
import 'package:marengoo/views/home_view/home_comonents/home_appbar.dart';
import 'package:marengoo/views/home_view/home_comonents/products_view.dart';
import 'package:marengoo/widgets/text_widget.dart';
import 'package:flutter_custom_tab_bar/library.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //initilization
  final ProductController productController = Get.put(ProductController());

  final PageController _controller = PageController();

  final CustomTabBarController _tabBarController = CustomTabBarController();

  //categories
  List<TabModel> categories = [
    TabModel(title: StringCons.newIn),
    TabModel(title: StringCons.womens),
    TabModel(title: StringCons.mens),
    TabModel(title: StringCons.jewelery),
    TabModel(title: StringCons.electronics),
  ];


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: categories.length,
        child: Scaffold(
          appBar: homeAppbar(),
          body: Column(
            children: [
              //tabs
              CustomTabBar(
                tabBarController: _tabBarController,
                height: 35,
                itemCount: categories.length,
                builder: getTabbarChild,
                indicator: StandardIndicator(
                  width: 20,
                  height: 3,
                  color: AppColor.titleColor,
                ),
                pageController: _controller,
              ),

              //tabs by product
              Expanded(
                  child: PageView.builder(
                      onPageChanged: (index) {
                        productController.fetechProduct(index);
                      },
                      controller: _controller,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return const ProductView();
                      }))
            ],
          ),
        ));
  }

//tab itme widget
  Widget getTabbarChild(BuildContext context, int index) {
    return TabBarItem(
        index: index,
        transform: ScaleTransform(
            maxScale: 1.3,
            transform: ColorsTransform(
              normalColor: AppColor.subtitleColor,
              highlightColor: AppColor.highlightColor,
              builder: (context, color) {
                return Container(
                    margin: const EdgeInsets.only(left: Sizes.dimen_10),
                    padding: const EdgeInsets.all(2),
                    alignment: Alignment.center,
                    constraints: const BoxConstraints(minWidth: 70),
                    child: (TextWidget(
                      title: categories[index].title.toUpperCase(),
                      weight: FontWeight.bold,
                      color: color,
                    )));
              },
            )));
  }
}
