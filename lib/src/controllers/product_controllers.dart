import 'package:get/get.dart';
import 'package:integrating_api/src/services/http_service.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = [].obs;

  @override
  void onInt() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await HttpService.fetchProducts();
      productList.value = products;
    } finally {
      isLoading(false);
    }
  }
}
