import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_internship_task/core/constant/app_color.dart';
import 'package:slash_internship_task/main_content/domain/entity/product.dart';
import 'package:slash_internship_task/main_content/presentation/controller/bloc.dart';
import 'package:slash_internship_task/main_content/presentation/controller/event.dart';
import 'package:slash_internship_task/main_content/presentation/controller/state.dart';
import 'package:slash_internship_task/main_content/presentation/screens/product_details_page.dart';

import '../../data/datasource/product_details_datasource.dart';
import '../../data/repository/product_details_repository.dart';
import '../../domain/repository/base_product_details_repository.dart';
import '../../domain/usecase/product_details_usecase.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10,),
      child: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          List<Product> allProducts = state is GetAllProductsState?state.result:[];
          return allProducts.isEmpty? const Center(child: CircularProgressIndicator(),) : GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 40.0,
                mainAxisSpacing: 50.0,
                childAspectRatio: 0.8
            ),
            itemCount: allProducts.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  // TODO: when click send event for product's id
                  //BlocProvider.of<ProductDetailsBloc>(context).add(GetProductDetailsEvent(allProducts[index].id));
                  // TODO: go to details page
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetailsPage(productId: allProducts[index].id,)));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  alignment: Alignment.topCenter,
                  child: Card(
                    color: AppColor.primaryColor,
                    shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.network(
                            allProducts[index].variations[0].productVariantImages[0].imagePath,
                            //allProducts[index].brand.brandLogoImagePath,
                            width: 100,
                            height: 80,
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
                        ),
                        const SizedBox(height: 20,),
                        // title
                        Text(
                          allProducts[index].name,
                          style: const TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        const SizedBox(height: 10,),
                        // price, favourite and  cart
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "EGP ${allProducts[index].variations[0].price}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),
                            const Row(
                              children: [
                                Icon(Icons.favorite_border_outlined, color: Colors.white70,),
                                SizedBox(width: 5,),
                                Icon(Icons.shopping_cart, color: Colors.white70,),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

