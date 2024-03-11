import 'package:flutter/material.dart';

import '../../domain/entity/product_variations.dart';

class CustomListViewProduct extends StatelessWidget {
  final List<ProductVariation> productVariationList;
  const CustomListViewProduct({super.key, required this.productVariationList});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      margin: const EdgeInsets.only(top: 10),
      child: productVariationList.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Center(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: productVariationList[0].productVariantImages.length,
              itemBuilder: (context, index) {
                String path = productVariationList[0].productVariantImages[index].imagePath;
                return Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
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
        ),
    );
  }
}

