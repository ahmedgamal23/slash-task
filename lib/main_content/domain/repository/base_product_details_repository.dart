import 'package:slash_internship_task/main_content/domain/entity/product.dart';

abstract class BaseProductDetailsRepository{
  Future<Product> getProductDetails(int productId);
}
