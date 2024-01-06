import 'package:fake_product/model/product_model.dart';
import 'package:fake_product/service/service_api.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxList<ProductModel> listProduct = <ProductModel>[].obs;
  RxBool loading = true.obs;
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future getData() async {
    try {
      var product = await ServiceAPI().fetchData();
      if (product != null) {
        listProduct.value = product;
      }
      loading(true);
    } finally {
      loading(false);
    }
  }

  Future changeImage(ProductModel model) async {
    
  }
}
