import 'package:flutter/material.dart';
import '../../domain/entity/product.dart';

class CustomListViewSize extends StatelessWidget {
  final Product? product;
  const CustomListViewSize({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      margin: const EdgeInsets.only(top: 10),
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: product?.variations.length,
          itemBuilder: (context, index) {
            final result = product?.variations[index].availableProperties.where((element) => element.property == "Size");

            if (result != null && result.isNotEmpty) {
              final val = result.first.value;
              return Container(
                width: 100,
                height: 40,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white70),
                  color: Colors.green
                ),
                child: Text(
                  "$val",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
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
