import 'package:get/get.dart';
import 'package:marengoo/constants/app_color.dart';
import 'package:marengoo/models/product_model.dart';

class CartController extends GetxController {
  var isLoading = false.obs;
  var cartProducts = <ProductModel>[].obs;

  double get totalAmount => cartProducts.fold(0, (p, e) => p + e.price);

  void addToCart(ProductModel cartItem) {
    cartProducts.add(cartItem);
    Get.snackbar("Notify", "Add to Cart",
        backgroundColor: AppColor.orangeColor);
  }

  void deleteFromCart(ProductModel cartItem) {
    if (cartProducts.isNotEmpty) {
      for (var item in cartProducts) {
        if (item.id == cartItem.id) {
          cartProducts.remove(cartItem);
          Get.snackbar("Notify", "Successfully Deleted",
              backgroundColor: AppColor.highlightColor);
        } else {
          Get.snackbar("Notify", "Something Wrong",
              backgroundColor: AppColor.orangeColor);
        }
      }
    }
  }

  List<ProductModel> get getCartProducct => cartProducts;
}
