import 'package:fake_product/model/product_model.dart';
import 'package:fake_product/view/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget itemProdcut(ProductModel model) {
  return GestureDetector(
    onTap: () => Get.to(DetailScreen(
      model: model,
    )),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            blurRadius: 3,
            color: Colors.grey,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: SizedBox(
              height: 180,
              child: Image.network(model.image!),
            ),
          ),
          Text(
            model.name!,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            model.detail!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: [
              Text(
                '\$ ${model.price!}',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              const Icon(Icons.shopping_cart),
            ],
          )
        ],
      ),
    ),
  );
}
