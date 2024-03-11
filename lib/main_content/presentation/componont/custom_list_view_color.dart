import 'package:flutter/material.dart';
import '../../domain/entity/product.dart';

class CustomListViewColor extends StatelessWidget {
  final Product? product;
  const CustomListViewColor({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 20,
      margin: const EdgeInsets.only(top: 10),
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: product?.variations.length,
          itemBuilder: (context, index) {
            final result = product?.variations[index].availableProperties.where((element) => element.property == "Color");

            if (result != null && result.isNotEmpty) {
              final formattedHex = '${result.first.value}';
              final hex = int.parse(formattedHex.substring(1), radix: 16);
              return Container(
                width: 20,
                height: 20,
                margin: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white70),
                  color: Color(hex),
                ),
              );
            }
            return null;
          },
        ),
      ),
    );
  }
}
