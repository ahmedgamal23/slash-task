import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_internship_task/main_content/data/datasource/products_datasource.dart';
import 'package:slash_internship_task/main_content/data/repository/products_repository.dart';
import 'package:slash_internship_task/main_content/domain/repository/base_products_repository.dart';
import 'package:slash_internship_task/main_content/domain/usecase/products_usecase.dart';
import 'package:slash_internship_task/main_content/presentation/controller/bloc.dart';
import 'package:slash_internship_task/main_content/presentation/controller/event.dart';
import '../componont/custom_gridview.dart';
import '../componont/custom_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    BaseProductsDatasource baseProductsDatasource = ProductsDatasource();
    BaseProductsRepository baseProductsRepository = ProductsRepository(baseProductsDatasource);
    BaseProductsUseCase baseProductsUseCase = ProductsUseCase(baseProductsRepository);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(bottom: 20,),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              // header
              const CustomHeader(containerHeight: 100,),
              const SizedBox(height: 20,),
              // display all products
              BlocProvider(
                create: (context) => ProductsBloc(baseProductsUseCase)..add(GetAllProductsEvent()),
                child: const CustomGridView()
              ),
            ],
          ),
        ),
      ),
    );
  }
}

