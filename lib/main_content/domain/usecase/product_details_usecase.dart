import 'package:slash_internship_task/main_content/domain/entity/product.dart';

import '../repository/base_product_details_repository.dart';

abstract class BaseProductDetailsUseCase{
  Future<Product> execute(int productId);
}

class ProductDetailsUseCase extends BaseProductDetailsUseCase{
  BaseProductDetailsRepository baseProductDetailsRepository;
  ProductDetailsUseCase(this.baseProductDetailsRepository);
  @override
  Future<Product> execute(int productId) {
    return baseProductDetailsRepository.getProductDetails(productId);
  }
}
