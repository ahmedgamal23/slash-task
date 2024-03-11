import 'package:slash_internship_task/main_content/domain/entity/product.dart';
import 'package:slash_internship_task/main_content/domain/repository/base_product_details_repository.dart';

import '../datasource/product_details_datasource.dart';

class ProductDetailsRepository extends BaseProductDetailsRepository{
  BaseProductDetailsDatasource baseProductDetailsDatasource;
  ProductDetailsRepository(this.baseProductDetailsDatasource);
  @override
  Future<Product> getProductDetails(int productId) {
    return baseProductDetailsDatasource.getProductDetails(productId);
  }
}
