import 'package:get/get.dart';
import 'package:marengoo/api_services/api_service.dart';
import 'package:marengoo/models/product_model.dart';

class ProductController extends GetxController {
  var isLoading = false.obs;
  var products = <ProductModel>[].obs;

  @override
  void onInit() {
    fetechProduct(0);

    super.onInit();
  }

  Future<void> fetechProduct(int index) async {
    isLoading(true);
    try {
      var responseproducts = await ApiService().fetchProducts('products');
      if (responseproducts.isNotEmpty) {
        switch (index) {
          case 0:
            products.value = responseproducts;
            break;

          case 1:
            products.value = responseproducts
                .where((element) =>
                    element.category.toLowerCase() == "women's clothing")
                .toList();
            break;

          case 2:
            products.value = responseproducts
                .where((element) =>
                    element.category.toLowerCase() == "men's clothing")
                .toList();
            break;

           case 3:
            products.value = responseproducts
                .where((element) =>
                    element.category.toLowerCase() == "jewelery")
                .toList();
            break;

            case 4:
            products.value = responseproducts
                .where((element) =>
                    element.category.toLowerCase() == "electronics")
                .toList();
            break;
          default:
        }
      }
    } finally {
      isLoading(false);
    }
  }
}
