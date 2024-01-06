import 'package:fake_product/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/item_product.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Shop"),
      ),
      body: Obx(
        () => Visibility(
          replacement: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1 / 1.5,
            children: List.generate(
              productController.listProduct.length,
              (index) => itemProdcut(
                productController.listProduct[index],
              ),
            ),
          ),
          visible: productController.loading.value,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
