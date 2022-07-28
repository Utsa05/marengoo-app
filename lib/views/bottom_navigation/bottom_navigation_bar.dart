import 'package:flutter/material.dart';
import 'package:marengoo/constants/app_color.dart';
import 'package:marengoo/controllers/cart_controller.dart';
import 'package:marengoo/controllers/product_controller.dart';
import 'package:marengoo/views/favorite_view/favorite_view.dart';
import 'package:marengoo/views/home_view/home_view.dart';
import 'package:marengoo/views/profile_view/profile_view.dart';
import 'package:marengoo/views/search_view/search_view.dart';
import 'package:get/get.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({Key? key}) : super(key: key);

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  final ProductController productController = Get.put(ProductController());
  final CartController cartController = Get.put(CartController());
  int selectedIndex = 0;
  final List<Widget> _pages = [
    const HomeView(),
    const SearchView(),
    const FavoriteView(),
    const ProfileViewView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColor.bgColor,
          selectedItemColor: AppColor.highlightColor,
          unselectedItemColor: AppColor.subtitleColor,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (value) {
            // Respond to item press.
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined,),
              label: 'Home'
            ),
            BottomNavigationBarItem(icon: Icon(Icons.search_outlined),label: 'Search'),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: 'Favorite'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile'
            ),
          ],
        ));
  }
}
