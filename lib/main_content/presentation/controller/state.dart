import 'package:slash_internship_task/main_content/domain/entity/product.dart';

abstract class ProductsState{}

class InitializationState extends ProductsState{}

class GetAllProductsState extends ProductsState{
  final List<Product> result;
  GetAllProductsState({required this.result});
}

class GetProductDetailsState extends ProductsState{
  final Product product;
  GetProductDetailsState({required this.product});
}
