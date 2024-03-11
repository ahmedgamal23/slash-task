import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_internship_task/core/constant/app_color.dart';
import 'package:slash_internship_task/main_content/domain/entity/product.dart';
import 'package:slash_internship_task/main_content/presentation/componont/custom_list_view_product.dart';
import 'package:slash_internship_task/main_content/presentation/controller/bloc.dart';
import 'package:slash_internship_task/main_content/presentation/controller/event.dart';
import 'package:slash_internship_task/main_content/presentation/controller/state.dart';
import '../../data/datasource/product_details_datasource.dart';
import '../../data/repository/product_details_repository.dart';
import '../../domain/repository/base_product_details_repository.dart';
import '../../domain/usecase/product_details_usecase.dart';
import '../componont/custom_expansion_title.dart';
import '../componont/custom_list_view_color.dart';
import '../componont/custom_list_view_size.dart';
import '../componont/custom_page_view.dart';
import '../componont/custom_text.dart';

class ProductDetailsPage extends StatelessWidget {
  final int productId;
  const ProductDetailsPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        title: const Text("Product details"),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        backgroundColor: AppColor.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: BlocProvider(
          create: (context) {
            BaseProductDetailsDatasource baseProductDetailsDatasource = ProductDetailsDatasource();
            BaseProductDetailsRepository baseProductDetailsRepository = ProductDetailsRepository(baseProductDetailsDatasource);
            BaseProductDetailsUseCase baseProductDetailsUseCase = ProductDetailsUseCase(baseProductDetailsRepository);
            return ProductDetailsBloc(baseProductDetailsUseCase)..add(GetProductDetailsEvent(productId));
          },
        child: BlocBuilder<ProductDetailsBloc, ProductsState>(
          builder: (context, state) {
            Product? product;
            if(state is GetProductDetailsState){
              product = state.product;
            }
            return Container(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // page view
                    CustomPageView(productVariationList: product?.variations??[] ,),
                    // sub parts
                    CustomListViewProduct(productVariationList: product?.variations??[] ,),
                    // available size
                    CustomListViewSize(product: product,),
                    const SizedBox(height: 20,),
                    // title and price
                    CustomText(title: product?.name??"Image Name", price: product?.variations[0].price??250,),
                    // color
                    CustomListViewColor(product: product),
                    const SizedBox(height: 30,),
                    // Description
                    CustomExpansionTitle(descriptionBody: product?.description??"description body",)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

