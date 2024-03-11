import 'package:slash_internship_task/main_content/domain/entity/product.dart';
import 'package:slash_internship_task/main_content/domain/repository/base_products_repository.dart';
import '../datasource/products_datasource.dart';

class ProductsRepository extends BaseProductsRepository{
  BaseProductsDatasource baseProductsDatasource;
  ProductsRepository(this.baseProductsDatasource);

  @override
  Future<List<Product>> getAllProducts() async {
    return await baseProductsDatasource.getAllProducts();
  }
}
