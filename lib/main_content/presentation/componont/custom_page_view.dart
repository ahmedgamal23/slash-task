import 'package:flutter/material.dart';
import '../../domain/entity/product_variations.dart';

class CustomPageView extends StatelessWidget {
  final List<ProductVariation> productVariationList;
  const CustomPageView({super.key, required this.productVariationList});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      margin: const EdgeInsets.only( top: 10),
      child: productVariationList.isEmpty? const Center(child: CircularProgressIndicator(),) :PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productVariationList[0].productVariantImages.length,
        itemBuilder: (context, index) {
          String path = productVariationList[0].productVariantImages[index].imagePath;
          return Container(
            margin: const EdgeInsets.only(left: 20, right: 20,),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.network(
              path,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return const Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 40,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

